---
title: Dynamic Leaderboards
---

## Leaderboard of pages, sorted by donation value

    GET https://everydayhero.com/api/v2/search/pages_totals

### Parameters

page_ids : _optional_ **string** or **Array**<br/>
Page ID, only totals for that the specified page or pages will be retrieved.
An Array of IDs can be provided, eg: page_ids[]=1&page_ids[]=2

exclude_page_ids : _optional_ **string** or **Array**<br/>
Page ID, exclude the specified pages from results.
An Array of IDs can be provided, eg: exclude_page_ids[]=1&exclude_page_ids[]=2

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

max_amount_cents : _optional_ **integer**<br/>
Cents value for the max amount a page should have raised to be displayable.

min_amount_cents : _optional_ **integer**<br/>
Cents value for the min amount a page should have raised to be displayable.

group_by : _optional_ **String**<br/>
Group leaderboard by type, supported values: pages, teams, groups. default: pages.

group_id : _optional_ **integer**<br/>
If group_by is set as groups, group_id is required, and should be the ID of the group to display on the leaderboard.

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
