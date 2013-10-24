---
title: Campaigns
---
## List all Campaigns <small>(public)</small>

    GET https://everydayhero.com/api/v2/campaigns

### Parameters

<div>charity_ids : _optional_ **string**</div>
<div>A comma-separated list of Charity IDs, only Campaigns that the specified
Charity is participating in will be retrieved.</div>

#### Pagination

For more information about pagination, please see the [pagination
overview](/overview/#pagination).

limit : _optional_ **integer**<br/>
The number of items per page.

page : _optional_ **integer**<br/>
The page number to return.

### Example

    https://everydayhero.com/api/v2/campaigns.json?charity_ids=au-1,au-2,au-3

### Response

<%= json :campaigns %>

## View a single Campaign <small>(public)</small>

    GET https://everydayhero.com/api/v2/campaigns/:id

[View demo in API console](/console/?query=campaigns/au-0.json) 

### Example

    https://everydayhero.com/api/v2/campaigns/au-1.json

### Response

<%= json :campaign %>
