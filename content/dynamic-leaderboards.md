---
title: Dynamic Leaderboards
---

## Leaderboard of pages, sorted by donation value

    GET https://everydayhero.com/api/v2/search/pages_totals

### Parameters

charity_id : _optional_ **string** or **Array**<br/>
Charity ID, only totals for that the specified Charity will be retrieved.
An Array of IDs can be provided, eg: charity_id[]=au-1&charity_id[]=au-2

campaign_id : _optional_ **string** or **Array**<br/>
Campaign ID, only totals for that the specified Campaign will be retrieved.
An Array of IDs can be provided, eg: campaign_id[]=au-1&campaign_id[]=au-2

start_at : _optional_ **string/date-time**<br/>
Start at date, ISO format: "2014-08-20 05:02:13", filter totals by a range.

end_at : _optional_ **string/date-time**<br/>
End at date, ISO format: "2014-08-20 05:02:13", filter totals by a range.

group_value : _optional_ **String/Array**<br/>
Return donations matching specific page group value, or any of the provided array values.
An Array of values can be provided, eg: group_value[]=QLD&group_value[]=ABC

#### Pagination

For more information about pagination, please see the [pagination
overview](/overview/#pagination).

limit : _optional_ **integer**<br/>
The number of items per page.

page : _optional_ **integer**<br/>
The page number to return.

### Example

    https://everydayhero.com/api/v2/search/pages_totals.json?campaign_id=au-0

<%= json :pages_totals %>
