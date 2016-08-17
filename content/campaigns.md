---
title: Campaigns
---
## List all Campaigns <small>(public)</small>

    GET https://everydayhero.com/api/v2/campaigns

### Parameters

charity_ids : _optional_ **string**<br/>
A comma-separated list of Charity IDs, only Campaigns that the specified Charity is participating in will be retrieved.

#### Pagination

For more information about pagination, please see the [pagination
overview](/overview/#pagination).

limit : _optional_ **integer**<br/>
The number of items per page.

page : _optional_ **integer**<br/>
The page number to return.

exclude_charities : _optional_ **boolean**<br/>
Exclude embedding of charity IDs, to reduce payload size. Default: false.

exclude_pages : _optional_ **boolean**<br/>
Exclude embedding of page IDs, to reduce payload size. Default: false.

### Example

    https://everydayhero.com/api/v2/campaigns.json?charity_ids=au-1,au-2,au-3

### Response

<%= json :campaigns %>

**Status** will be: active, expired or disabled.

## View a single Campaign <small>(public)</small>

    GET https://everydayhero.com/api/v2/campaigns/:id

### Example

    https://everydayhero.com/api/v2/campaigns/au-1.json

### Response

<%= json :campaign %>
