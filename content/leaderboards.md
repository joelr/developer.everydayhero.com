---
title: Leaderboards
---

* TOC
{:toc}

The Leaderboards API allows you to retrieve leaderboards and their
assocated pages.

## List all Leaderboards

    GET /leaderboards

### Visibility

Public.

### Parameters

ids
: _Optional_ **string** - `1,5,20` to only retrieve leaderboards with
the ids 1, 5 and 20

### Response

<%= json :leaderboards %>

## View a single Leaderboard

    GET /leaderboards/:id

### Visibility

Public.

### Response

<%= json :leaderboard %>

## View a Campaign Leaderboard

Campaign Leaderboards are a way of showing the top supporter pages for a
particular campaign.

    GET /campaigns/:id/leaderboard

### Visibility

Public.

### Parameters

type
: _Optional_ **string**. The types of pages that are required. Supported
values include `all`, `individual` and `team`. Defaults to `all`.

limit
: _Optional_ **integer**. The number of records retrieved. This is useful
for showing a "top 10 supporters leaderboard". Defaults to `10`.

### Response

<%= json :campaign_leaderboard %>
