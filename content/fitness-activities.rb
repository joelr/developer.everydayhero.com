---
title: Fitness Activities
---

* TOC
{:toc}

Pages can have fitness activities associated with them. Complementary to fitness 
activities synced from within the application (e.g. Strava, MapMyFitness),
applications can create their own activities.

Example activity on a supporter page:

![Authorization Screen](/images/fitness.jpg)


## Retreive a list of Fitness Activities

    GET https://everydayhero.com/api/v2/search/fitness_activities

### Parameters

charity_id : _optional_ **string** or **Array**<br/>
Charity ID, only totals for that the specified Charity will be retrieved.
An Array of IDs can be provided, eg: charity_id[]=au-1&charity_id[]=au-2

campaign_id : _optional_ **string** or **Array**<br/>
Campaign ID, only totals for that the specified Campaign will be retrieved.
An Array of IDs can be provided, eg: campaign_id[]=au-1&campaign_id[]=au-2

page_id : _optional_ **string** or **Array**<br/>
Page ID, only totals for the specified Pages will be retrieved.
An Array of IDs can be provided, eg: page_id[]=111&page_id[]=456

team_id : _optional_ **string**<br/>
team_uid : _optional_ **string**<br/>
team_page_id : _optional_ **string**<br/>
Team ID, only totals for that the specified Team will be retrieved.

start_at : _optional_ **string/date-time**<br/>
Start at date, ISO 8601 format: "2014-08-20T05:02:13", filter totals by a range.

end_at : _optional_ **string/date-time**<br/>
End at date, ISO 8601 format: "2014-08-20T05:02:13", filter totals by a range.

type : _optional_ **string**<br/>
Filter by activity type: e.g. bike, gym, hike, run, sport, swim, walk

include_manual : _optional_ **boolean**<br/>
Include manually entered activities. Default: false.

exclude_virtual : _optional_ **boolean**<br/>
Exclude virtual activities. Default: false

exclude_non_virtual : _optional_ **boolean**<br/>
Exclude non-virtual activities. Default: false

#### Pagination

For more information about pagination, please see the [pagination
overview](/overview/#pagination).

limit : _optional_ **integer**<br/>
The number of items per page.

page : _optional_ **integer**<br/>
The page number to return.

### Example

    https://everydayhero.com/api/v2/search/fitness_activities.json?campaign_id=au-0

### Response

<%= json :search_fitness_activities %>


## Create/Update Fitness Activity

<p class='info'><strong>Authentication types</strong>: OAuth User Token only</p>


    POST https://everydayhero.com/api/v2/fitness_activities

### Parameters

uid : _required_ **string**<br/>
Unique identifier to fitness activity, to be used later for updating activities if required.

type : _required_ **string**<br/>
Fitness activity type, supported types: bike, gym, hike, run, swim, walk and sport.

duration_in_seconds : _required_ **integer**<br/>
Duration of activity, in seconds.

manual : _optional_ **boolean**<br/>
Manually logged activity, should be true if this manually user created activity, false if it is logged via an application.<br/>

virtual : _optional_ **boolean**<br/>
Virtually logged activity, should be true if this is via a virtual app, eg Zwift, false for most cases.<br/>

trainer : _optional_ **boolean**<br/>
Trainer logged activity, should be true if this is via a cycling turbo trainer, false for most cases.<br/>

public : _required_ **boolean**<br/>
Must be true for the fitness activity to be visible.

started_at : _required_ **date/time**<br/>
Timestamp for start of activity, ISO8601 format.

caption : _required_ **string**<br/>
Title/caption for activity.

distance_in_meters : _optional_  **integer**<br/>
Distance covered for activity, in meters.

distance : _optional_  **integer**<br/>
Distance covered for activity, in any distance format. Requires **unit** attributes to be sent<br/>

unit : _optional_  **string**<br/>
Unit for distance, e.g.: meter, foot, step, yard, mile, km. Requires **distance** attribute to be sent.<br/>

calories : _optional_ **integer**<br/>
kcals total burned per activity, e.g. ~600 for a 10km run.

coordinates : _optional_ **Array**<br/>
To be used to render a map, if provided. Array of lat/longs,<br/>
e.g. [[10.614, -7.031],[10.612, -7.027],[10.609, -7.020]..]

elevation_series : _optional_ **Array**<br/>
Array of elevation points (in meters), used to render an elevation chart if provided.<br/>
e.g. [0.2, 0.8, 1.2, 5.6]

average_watts : _optional_ **integer**<br/>
Average power output for an activity (normally a 'bike' activity).

average_heartrate : _optional_ **integer**<br/>
Average heart rate in bpm for an activity.

average_cadence : _optional_ **integer**<br/>
Average cadence in rpm for an activity (normally a 'bike' activity).

average_temp : _optional_ **integer**<br/>
Average external temperature in degrees celcius for an activity.

description : _optional_ **string**<br/>
Description of an activity.


### Example

    curl -H "Authorization: Bearer XXX" \
    -d "{\"uid\":\"abc\",\"type\":\"bike\",\"duration_in_seconds\":1234,\"public\":true,\"started_at\":\"2015-01-01 09:00:00\",\"distance_in_meters\":1234,\"calories\":100,\"coordinates\":[[10.614,-7.031],[10.612,-7.027],[10.609,-7.02]],\"elevation_series\":[0.2,0.8,1.2,5.6],\"caption\":\"test-ride\"}" \
    https://everydayhero.com/api/v2/fitness_activities.json

### Response

201 CREATED

or 

422 Unprocessable Entity

<%= json \
  error: {
    message: "Validation failed",
    error: [{field: "type", code:"invalid"}]
  }
%>
