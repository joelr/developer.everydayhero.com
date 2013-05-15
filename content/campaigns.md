---
title: Campaigns
---

The Campaigns API allows you to list and view campaigns.

* TOC
{:toc}

## List all Campaigns

    GET /campaigns

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

    GET /campaigns/:id

### Visibility

Public.

### Response

<%= json :campaign %>
