---
title: Leaderboards
---

* TOC
{:toc}

The Leaderboards API allows you to retrieve leaderboards and their
assocated pages.

## List all Leaderboards <small>(public)</small>

    GET https://everydayhero.com/api/v2/leaderboards

### Parameters

ids : _optional_ **string**<br/>
`1,5,20` to only retrieve leaderboards with the ids 1, 5 and 20

### Example

    https://everydayhero.com/api/v2/leaderbords.json?ids=1,5,20

### Response

<%= json :leaderboards %>

## View a single Leaderboard <small>(public)</small>

    GET https://everydayhero.com/api/v2/leaderboards/:id

### Example

    https://everydayhero.com/api/v2/leaderbords/1.json

### Response

<%= json :leaderboard %>

## View a Campaign Leaderboard <small>(public)</small>

Campaign Leaderboards are a way of showing the top supporter pages for a
particular campaign.

    GET https://everydayhero.com/api/v2/campaigns/:id/leaderboard

### Parameters

type : _optional_ **string**<br/>
The types of pages that are required. Supported values include `all`, `individual` and `team`. Defaults to `all`.

limit : _optional_ **integer**<br/>
The number of records retrieved. This is useful for showing a "top 10 supporters leaderboard". Defaults to `10`.

### Example

    https://everydayhero.com/api/v2/leaderbords/au-1/leaderboard.json?type=individual&limit=5

### Response

<%= json :campaign_leaderboard %>
