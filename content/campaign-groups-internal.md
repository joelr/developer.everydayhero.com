---
title: Campaigns Groups Internal
---

Creating groups 
Groups are *required* on page creation where groups exist.

<p class='info'><strong>Authentication types</strong>: Registered (Internal) Application Token</p>


## Create Groups for campaign

Example request to create a group

    POST /api/v2/internal/campaigns/CAMPAIGN_UID_OR_UUID/groups
    Authorization: Bearer APP_BEARER_TOKEN
    Content-Type: application/json

    {"key":"some_key","label":"Some label"}

Example request to update a group

    PATCH /api/v2/internal/campaigns/CAMPAIGN_UID_OR_UUID/groups/GROUP_ID
    Authorization: Bearer APP_BEARER_TOKEN
    Content-Type: application/json

    {"key":"some_key","label":"Some label"}

Example request to delete a group

    DELETE /api/v2/internal/campaigns/CAMPAIGN_UID_OR_UUID/groups/GROUP_ID
    Authorization: Bearer APP_BEARER_TOKEN

## Create Groups values within a group

Example request to create a group value, position is optional (defaults to end of list).
Position starts at 1 (ie, not 0)

    POST /api/v2/internal/campaigns/CAMPAIGN_UID_OR_UUID/groups/GROUP_ID/group_values
    Authorization: Bearer APP_BEARER_TOKEN
    Content-Type: application/json

    {"value":"A group value"}

Example request to update a group value.
Position starts at 1 (ie, not 0)

    PATCH /api/v2/internal/campaigns/CAMPAIGN_UID_OR_UUID/groups/GROUP_ID/group_values/GROUP_VALUE_ID
    Authorization: Bearer APP_BEARER_TOKEN
    Content-Type: application/json

    {"value":"A newer group value","position":"1"}

Example request to delete a group value

    DELETE /api/v2/internal/campaigns/CAMPAIGN_UID_OR_UUID/groups/GROUP_ID/group_values/GROUP_VALUE_ID
    Authorization: Bearer APP_BEARER_TOKEN
