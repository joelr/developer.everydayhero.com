---
title: Notifications & Alerts
body_id: notifications
---
If you have created an [OAuth Application](/oauth-integration/#creating-an-oauth-application), or have a RegisteredApplication, you will have the ability to receive notifications & errors for failed API requests.

### Usage

If you have created an OAuthApplication, you can edit the notification email address under the [OAuth Application Management](/oauth-integration/#creating-an-oauth-application) screen. If you are using a RegisteredApplication, you will need to request the email be set via Professional Services

Notifications will be sent for `unprocessable_entity, forbidden and bad_request` responses. Details of the request, along with authentication, payload and error details will be provided within the email. Some errors are not able to be raised via email if for example, the JSON payload is unprocessable, or the API authentication has failed.