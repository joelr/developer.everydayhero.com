---
title: Campaigns
---
## List all Campaigns

    GET https://everydayhero.com/api/v2/campaigns

### Visibility

Public.

### Parameters

charity_ids : _optional_ **string**<br/>
A comma-separated list of Charity IDs, only Campaigns that the specified Charity is participating in will be retrieved.

### Example

    https://everydayhero.com/api/v2/campaigns.json?charity_ids=au-1,au-2,au-3

### Response

<%= json :campaigns %>

## View a single Campaign

    GET https://everydayhero.com/api/v2/campaigns/:id

[View demo in API console](/console/?query=campaigns/au-0.json) 

### Visibility

Public.

### Example

    https://everydayhero.com/api/v2/campaigns/au-1.json

### Response

<%= json :campaign %>
