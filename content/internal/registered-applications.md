---
title: Registered Applications
body_id: internal_overview
---

<p class='warning'>Registered Applications are not the optimum method of authenticating with the API. All API endpoints are now available via OAuth and can be self-served via <a href='/oauth-integration/#how-to-authenticate-with-edh'>Authentication</a>.</p>


<p class='info'><strong>Authentication types</strong>: OAuth (Internal) Application Token</p>

## Listing Registered Applications 

    GET /api/v2/internal/registered_applications?registered_application[campaign_uid]=CAMPAIGN_UID
    Authorization: Bearer APP_BEARER_TOKEN
    Content-Type: application/json

## Creating a registered application

    POST /api/v2/internal/registered_applications
    Authorization: Bearer APP_BEARER_TOKEN
    Content-Type: application/json

    {"registered_application":{"name":"test","campaign_uid":"au-123"}}

#### Available params:

campaign_uid : _required_ **string**<br/>
UID of the campaign

individual_registration_url : _optional_ **string**<br/>
Registration redirect for individual pages (when a user accesses get-started)

team_registration_url : _optional_ **string**<br/>
Registration redirect for individual pages joining teams (when a user accesses join team)

name : _required_ **string**<br/>
Name of the application

trusted : _optional_ **boolean**<br/>
Trusted or not, default false. This is a deprecated permission, required for accessing the v1 API.


#### Example curl request

    curl -X POST -H "Authorization: Bearer xxx" -H "Content-Type: application/json" -d '{"registered_application":{"campaign_uid":"xxx","name":"test"}}' "http://everydayhero.com/api/v2/internal/registered_applications"


## Updating a registered application

    PATCH /api/v2/internal/registered_applications/APPLICATION_UID
    Authorization: Bearer APP_BEARER_TOKEN
    Content-Type: application/json

    {"registered_application":{"name":"test"}}

#### Available params:

individual_registration_url : _optional_ **string**<br/>
Registration redirect for individual pages (when a user accesses get-started)

team_registration_url : _optional_ **string**<br/>
Registration redirect for individual pages joining teams (when a user accesses join team)

name : **string**<br/>
Name of the application

trusted : _optional_ **boolean**<br/>
Trusted or not, default false. This is a deprecated permission, required for accessing the v1 API.

#### Example curl request

    curl -X PATCH -H "Authorization: Bearer xxx" -H "Content-Type: application/json" -d '{"registered_application":{"name":"test2"}}' "http://everydayhero.com/api/v2/internal/registered_applications/APPLICATION_UID"


## Viewing a registered application

    GET /api/v2/internal/registered_applications/APPLICATION_UID?access_token=ACCESS_TOKEN


## Deleting a registered application

    DELETE /api/v2/internal/registered_applications/APPLICATION_UID
    Authorization: Bearer APP_BEARER_TOKEN
    Content-Type: application/json
