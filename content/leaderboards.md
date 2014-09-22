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

#### Pagination

For more information about pagination, please see the [pagination
overview](/overview/#pagination).

limit : _optional_ **integer**<br/>
The number of items per page.

page : _optional_ **integer**<br/>
The page number to return.

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

charity_ids : _optional_ **string**<br/>
Only retrieve pages associated to the charity(ies) specified. Multiple charities
can be passed through as comma separated values, i.e. 'au-1,au-5'.

all_pages : _optional_ **boolean**<br/>
Retrieve all pages including these inactive or expired pages. It is default set to false, and therefore only active pages will be included in the results by default.

### Example

    https://everydayhero.com/api/v2/campaigns/au-1/leaderboard.json?type=individual&charity_ids=au-1,au-5&limit=5

### Response

<%= json :campaign_leaderboard %>
