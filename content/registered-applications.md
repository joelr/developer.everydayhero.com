---
title: Registered Applications
---

<p class='info'><strong>Authentication types</strong>: OAuth (Partner) Bearer Token</p>

## Listing Registered Applications 

    GET /api/v2/internal/registered_applications?registered_application[campaign_uid]=CAMPAIGN_UID
    Authorization: Bearer APP_BEARER_TOKEN
    Content-Type: application/json


## Creating registered application

    POST /api/v2/internal/registered_applications
    Authorization: Bearer APP_BEARER_TOKEN
    Content-Type: application/json

Post body:

    {"registered_application":{"campaign_uid":"CAMPAIGN_UID","name":"App name"}}

Optional params: individual_registration_url, team_registration_url, trusted.


## Updating registered application

    PATCH /api/v2/internal/registered_applications/APP_ID
    Authorization: Bearer APP_BEARER_TOKEN
    Content-Type: application/json

Post body:

    {"registered_application":{"campaign_uid":"CAMPAIGN_UID","name":"App name"}}

## Deleting registered application

    DELETE /api/v2/internal/registered_applications/APP_ID
    Authorization: Bearer APP_BEARER_TOKEN
    Content-Type: application/json
