---
title: Campaigns Groups
body_id: internal_overview
---

Creating groups 
Groups are *required* on page creation where groups exist.

<p class='info'><strong>Authentication types</strong>: OAuth (Internal) Application Token</p>


## List Groups for campaign

Example request to list a group and it's values (public)

    GET /api/v2/campaigns/CAMPAIGN_UID/groups
    Content-Type: application/json

## List Group values for specific group

Example request to list a group's values

    GET /api/v2/internal/campaigns/CAMPAIGN_UID_OR_UUID/groups/GROUP_ID/group_values
    Authorization: Bearer APP_BEARER_TOKEN
    Content-Type: application/json

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

Example request to create a batch update:

    POST /api/v2/internal/campaigns/CAMPAIGN_UID_OR_UUID/groups/GROUP_ID/group_values
    Authorization: Bearer APP_BEARER_TOKEN
    Content-Type: application/json

    {"group_values":[{"value":"A group value"},{"value":"A group value 2"},{"value":"A group value 3"}]}

Example request to update a group value.
Position starts at 1 (ie, not 0)

    PATCH /api/v2/internal/campaigns/CAMPAIGN_UID_OR_UUID/groups/GROUP_ID/group_values/GROUP_VALUE_ID
    Authorization: Bearer APP_BEARER_TOKEN
    Content-Type: application/json

    {"value":"A newer group value","position":"1"}

Example request to delete a group value

    DELETE /api/v2/internal/campaigns/CAMPAIGN_UID_OR_UUID/groups/GROUP_ID/group_values/GROUP_VALUE_ID
    Authorization: Bearer APP_BEARER_TOKEN

Example request to delete a group value and associate pages to another group value

Here there's an optional NEW_GROUP_VALUE_ID which can be used to associate pages from the group to be deleted to the new group. If this is not provided, any pages with the previous group will become invalid. the Assign method can be used to associate unassinged pages to a group.

    DELETE /api/v2/internal/campaigns/CAMPAIGN_UID_OR_UUID/groups/GROUP_ID/group_values/GROUP_VALUE_ID?new_group_value_id=NEW_GROUP_VALUE_ID
    Authorization: Bearer APP_BEARER_TOKEN

## Assign unassigned/invalid pages to a group

This request can be used to associate pages with no group value to the specified group value. This is useful if a group value has been deleted with no fallback, or if groups are added to a campaign after pages have been created.

    POST /api/v2/internal/campaigns/CAMPAIGN_UID_OR_UUID/groups/GROUP_ID/group_values/GROUP_VALUE_ID/assign
    Authorization: Bearer APP_BEARER_TOKEN
    Content-Type: application/json
