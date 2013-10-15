---
title: Campaigns
---
## List all Campaigns

    GET https://everydayhero.com/api/v2/campaigns

### Visibility

Public.

### Parameters

charity_ids
: _Optional_ **string**. A comma-separated list of Charity IDs, only
Campaigns that the specified Charity is participating in will be
retrieved.

### Response

<%= json :campaigns %>

## View a single Campaign

    GET https://everydayhero.com/api/v2/campaigns/:id

[View demo in API console](/console/?query=campaigns/au-0.json) 

### Visibility

Public.

### Response

<%= json :campaign %>
