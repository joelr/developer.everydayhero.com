---
title: Search Fitness Activities
---

## Fitness Activities Leaderboard

    GET https://everydayhero.com/api/v2/search/fitness_activities_totals

### Parameters

charity_id : _optional_ **String** or **Array**<br/>
Charity ID, only totals for that the specified Charity will be retrieved.
An Array of IDs can be provided, eg: charity_id[]=au-1&charity_id[]=au-2

campaign_id : _optional_ **String** or **Array**<br/>
Campaign ID, only totals for that the specified Campaign will be retrieved.
An Array of IDs can be provided, eg: campaign_id[]=au-1&campaign_id[]=au-2

page_id : _optional_ **String** or **Array**<br/>
Page ID, only totals for the specified Pages will be retrieved.
An Array of IDs can be provided, eg: page_id[]=111&page_id[]=456

team_id : _optional_ **String**<br/>
team_uid : _optional_ **String**<br/>
team_page_id : _optional_ **String**<br/>
Team ID, only totals for that the specified Team will be retrieved.

start_at : _optional_ **String/date-time**<br/>
Start at date, ISO format: "2014-08-20 05:02:13", filter totals by a range.

end_at : _optional_ **String/date-time**<br/>
End at date, ISO format: "2014-08-20 05:02:13", filter totals by a range.

type : _optional_ **String**<br/>
Filter by activity type: e.g. bike, gym, hike, run, sport, swim, walk

include_manual : _optional_ **Boolean**<br/>
Include manually entered activities. Default: false.

exclude_virtual : _optional_ **Boolean**<br/>
Exclude virtual activities. Default: false

group_value : _optional_ **String/Array**<br/>
Return pages matching specific page group value, or any of the provided array values.
An Array of values can be provided, eg: group_value[]=QLD&group_value[]=ABC

min_distance_in_meters : _optional_ **Integer**<br/>
Returns pages that have achieved a specified distance value. This is a post-filter action that may reduce the result set lower than the limit.

max_distance_in_meters : _optional_ **Integer**<br/>
Returns pages that are under a specified distance value. This is a post-filter action that may reduce the result set lower than the limit.

exclude_non_virtual : _optional_ **Boolean**<br/>
Exclude non-virtual activities. Default: false

Includes all above paramaters as well as

group_by : _optional_ **String**<br/>
Group results by pages, groups or teams. Default: pages

group_id : _optional_ **Integer**<br/>
Required if group_by: teams is set. Used to specify the group being filtered by.

sort_by : _optional_ **String**<br/>
Sort results by distance_in_meters, duration_in_seconds, elevation_in_meters or
calories. Default: distance_in_meters

limit : _optional_ **Integer**<br/>
Returns a specified number of records. Default: 200.


### Example

    https://everydayhero.com/api/v2/search/fitness_activities_totals.json?campaign_id=au-0&type=bike&group_by=pages

### Response

<%= json :fitness_activities_totals %>
