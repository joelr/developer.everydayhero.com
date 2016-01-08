---
title: Search Fitness Activities
---

## Fitness Activities Leaderboard

    GET https://everydayhero.com/api/v2/search/fitness_activities_totals

### Parameters

Includes all above paramaters as well as

group_by : _optional_ **string**<br/>
Group results by pages or teams. Default: pages

sort_by : _optional_ **string**<br/>
Sort results by distance_in_meters, duration_in_seconds, elevation_in_meters or
calories. Default: distance_in_meters


### Example

    https://everydayhero.com/api/v2/search/fitness_activities_totals.json?campaign_id=au-0&type=bike&group_by=pages

### Response

<%= json :fitness_activities_totals %>
