---
title: Charities
---

* TOC
{:toc}

## List all Charities

    GET /charities

### Visibility

Public.

### Parameters

campaign_id
: _Optional_ **string**. Retrieve only the charities participating in a
campaign.

### Response

<%= json :charities %>

## View a single Charity

    GET /charities/:id

### Visibility

Public.

### Response

<%= json :charity %>
