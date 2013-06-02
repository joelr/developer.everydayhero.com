---
title: Charities
---
## List all Charities

    GET /charities

[View demo in API console](/console/?query=charities.json) 

### Visibility

Public.

### Parameters

campaign_ids
: _Optional_ **string**. A comma-separated list of Campaign IDs, only
Charities participating in the specified Campaigns will be retrieved.

### Response

<%= json :charities %>

## View a single Charity

    GET /charities/:id

[View demo in API console](/console/?query=charities/au-8.json) 


### Visibility

Public.

### Response

<%= json :charity %>
