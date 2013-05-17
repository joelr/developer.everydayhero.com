---
title: Charities
---
## List all Charities

    GET /charities

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

### Visibility

Public.

### Response

<%= json :charity %>
