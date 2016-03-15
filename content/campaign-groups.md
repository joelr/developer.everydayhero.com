---
title: Campaigns Groups
---

Campaign groups are attributes that as assigned to a page on creation (and can be edited later if required.).

Groups are *required* on page creation where groups exist.

## List Groups for campaign <small>(public)</small>

Example request to fetch groups for campaign au-1234:

    GET https://everydayhero.com/api/v2/campaigns/au-1234/groups

## Response

The response for campaign groups returns an array of available groups, along with a label, key and array of values.

The key and an associated value should be used when creating a page for the specific campaign, see [page creation](/pages/#create-an-individual-page).

If the campaign has no available groups, the response will be an empty array.

### Example response

<%= json :campaign_groups %>
