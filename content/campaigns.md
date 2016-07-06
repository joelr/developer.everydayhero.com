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

or

    GET https://everydayhero.com/api/v2/campaigns/:uuid

[View demo in API console](/console/?query=campaigns/au-0.json)

### Example

    https://everydayhero.com/api/v2/campaigns/au-1.json

or

    https://everydayhero.com/api/v2/campaigns/f6ab24ed-589b-4736-a5bb-aee08d412379.json

### Response

<%= json :campaign %>
