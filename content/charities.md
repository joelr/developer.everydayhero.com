---
title: Charities
---
## List all Charities

    GET https://everydayhero.com/api/v2/charities

[View demo in API console](/console/?query=charities.json) 

### Visibility

Public.

### Parameters

campaign_ids
: _Optional_ **string**. A comma-separated list of Campaign IDs, only
Charities participating in the specified Campaigns will be retrieved.

### Example

    https://everydayhero.com/api/v2/charities.json?campaign_ids=au-1,au-2,au-3

### Response

<%= json :charities %>

## View a single Charity

    GET https://everydayhero.com/api/v2/charities/:id

[View demo in API console](/console/?query=charities/au-8.json) 


### Visibility

Public.

### Example

    https://everydayhero.com/api/v2/charities/au-1.json

### Response

<%= json :charity %>
