---
title: Webhooks
body_id: webhooks
---
If you have created an [OAuth Application](/oauth-integration/#creating-an-oauth-application), you will have the ability to create webhooks. Webhooks can be defined whilst creating/editing your OAuth application and multiple URLs can be defined by separating with a space.

### Usage

Webhooks can be used as an alternative to polling endpoints to fetch updates for pages. It is important that webhook receiving endpoints return a 200 response as soon as possible, as requests will timeout after 2000ms. It is recommended not to perform any work within the receive request, but to queue the data to be processed at a later stage, so the request can be exited early.

To respond as quickly to a webhook, subscribers should defer any processing of the notification until after the response is done. You may do this in a few ways, but two popular options are to spawn a new thread to handle the processing, or to place the notification in a queue for later processing. Since you're likely already using queues for your processing, this is probably your best option.

Requests will also fail and be ignored without a retry for any connectivity timeout, DNS or URL validity issues.

Currently supported payloads: **page**

### Page payloads

Page payloads will be triggered under the following conditions:

#### Trigger conditions

Webhooks will be triggered for all pages for all users who have authenticated with your application, regardless of it the page was created via the application.

  * Page created/updated
  * Donation received
  * Page shared

#### Payload format

Payloads will be in JSON in the standard [page payload](/pages/) format.

**Custom format**: If a custom payload or authentication is required, please email [api@everydayhero.com](mailto:api@everydayhero.com) to discuss requirements.