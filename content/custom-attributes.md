---
title: Custom Attributes
---

There are a variety of custom attributes/flags for some objects that change behaviour which aren't accessible via the UI or the API.

If you require any of the following flags set, please contact [api@everydayhero.com.au](mailto:api@everydayhero.com.au).

## Campaigns

donate_thank_you_url : **string**<br/>
Campaigns can have a custom confirmation (thank-you url) for donations, where users are redirected after a successful donation.

skip_team_approval_request : **boolean**<br/>
Campaigns may require join-requests to teams to be auto-approved. This removes the normal requirement that a team has to confirm team join requests.

#### Offline donations
For regions where offlines do not exist in the campaign UI, these have to be enabled at a campaign level.
enable_recording_offline_donations_for_supporter

## Charities

dashboard_background : **Image**<br/>
Charites have the ability to have custom dashboard backgrounds. When a user creates a page for a relevant charity, the user is prompted to whether they would like to change their dashboard background to the custom background.

#### Campaign-only charities
Some charities may wish to only exist within campaigns (and not within the give. everydayhero campaign), this can be enabled on request.

