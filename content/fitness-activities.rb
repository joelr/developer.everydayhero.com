---
title: Fitness Activities
---

Pages can have fitness activities associated with them. Complementary to fitness 
activities synced from within the application (e.g. Strava, MapMyFitness),
applications can create their own activities.

Example activity on a supporter page:

![Authorization Screen](/images/fitness.jpg)

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

public : _required_ **boolean**<br/>
Must be true for the fitness activity to be visible.

started_at : _required_ **date/time**<br/>
Timestamp for start of activity, ISO8601 format.

caption : _required_ **string**<br/>
Title/caption for activity.

distance_in_meters : _optional_  **integer**<br/>
Distance covered for activity, in meters.

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
