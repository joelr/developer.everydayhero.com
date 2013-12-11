---
title: Charities
---
## List all Charities <small>(public)</small>

    GET https://everydayhero.com/api/v2/charities

[View demo in API console](/console/?query=charities.json) 

### Parameters

campaign_ids : _optional_ **string**<br/>
A comma-separated list of Campaign IDs, only Charities participating in the specified Campaigns will be retrieved.

#### Pagination

For more information about pagination, please see the [pagination
overview](/overview/#pagination).

limit : _optional_ **integer**<br/>
The number of items per page.

page : _optional_ **integer**<br/>
The page number to return.

### Example

    https://everydayhero.com/api/v2/charities.json?campaign_ids=au-3707,au-1493

### Response

<%= json :charity_index %>

## View a single Charity <small>(public)</small>

    GET https://everydayhero.com/api/v2/charities/:id

[View demo in API console](/console/?query=charities/au-8.json) 

### Example

    https://everydayhero.com/api/v2/charities/au-27.json

### Response

<%= json :charity_show %>
