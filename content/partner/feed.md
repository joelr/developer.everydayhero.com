---
title: Activity Feed
body_id: activity_feed
---

This API is used for fetching activities for display on activities feeds including the following items:

  - Donations (Both offline & online)
  - Fitness Activities
  - Posts
  - Charity / Event messages

## URL

    GET https://everydayhero.com/api/v2/search/feed


### Params

page_id : _optional_ **string**<br/>
The ID of the page(s) to fetch items for, multiple pages can be comma separated.

team_id : _optional_ **string**<br/>
The ID of the team(s) to fetch items for, multiple teams can be comma separated.

campaign_id : _optional_ **string**<br/>
The UID of the campaign(s) to fetch items for, multiple campaigns can be comma separated.

charity_id : _optional_ **string**<br/>
The UID of the charity(s) to fetch items for, multiple charities can be comma separated.

type : _optional_ **string**<br/>
The object types to be returned, multiple types can be comma separated.
Permitted values are: `OnlineDonation, OfflineDonation, MessageReference, Post, FitnessActivity`.

sort : _optional_ **string**<br/>
The sorting order. The default order is newest to oldest, other options include `amount_desc, amount_asc`. These values can only be used when restricting results to OnlineDonation and/or OfflineDonation.



### Response

The response will return an array within a `results` attribute, by default pagination is limited to 100 records:

<%= json \
  results: [
    {
      title: "example feed item"
    }
  ],
  meta: {
    pagination: nil
  }
%>

### Pagination

For pagination to be enabled, a `page_size` and `page` param need to be provided, this will add additional data to the pagination response.

    https://everydayhero.com/api/v2/search/feed?page_size=1&page=1
eg

<%= json \
  results: [
    {
      title: "example feed item"
    }
  ],
  meta: {
    pagination: {
      current_page: 1,
      count: 1234,
      total_pages: 1234,
      first_page: true,
      last_page: false
    }
  }
  
%>




## Object response formats

Response formats for each activity type is listed below:

### Donations

`page_groups` includes an array of page group values if defined on a page.

`_type` can be either `online_donation` or `offline_donation`.

<%= json \
  amount: {
    cents: 1000,
    currency: {
      symbol: "$",
      name: "Australian Dollar",
      iso_code: "AUD"
    },
  },
  created_at: "2017-07-31T05:53:29.000Z",
  team_id: 1234,
  page_groups: [],
  message: "Good luck!",
  campaign_uid: "au-123",
  page_id: 123,
  charity_uid: "au-123",
  nickname: "mr donor",
  thankyou_message: "Thanks!",
  _type: "online_donation"
%>

### Fitness Activity

`page_groups` includes an array of page group values if defined on a page.

`source` if provided defines the source provider, currently: fitbit, mapmyfitness or strava.

`trainer` is a boolean which indicates if the activity was performed on an indoor trainer.

`virtual` is a boolean which indicates if the activity was performed virtually, for example using Zwift.

`coordinate` if provided, is the start location of the activity.

`elevation_series` if provided, provides a samples timeseries of elevation points in meters.

`polyline` if provided, provides a [encoded polyline](https://developers.google.com/maps/documentation/utilities/polylinealgorithm) version of the lat/lon points of the activity.


<%= json \
  virtual: false,
  caption: "My run!",
  created_at: "2017-07-31T05:35:33.000Z",
  team_id: 1234,
  source: "mapmyfitness",
  uid: "mapmyfitness-123456",
  page_id: 1234,
  trainer: false,
  charity_uid: "au-123",
  campaign_uid: "au-123",
  id: 1234,
  coordinate: {
    lat: 0.1234,
    lon: 0.2456,
  },
  calories: 1234,
  page_groups: [],
  elevation_series: [],
  distance_in_meters: 123.456,
  duration_in_seconds: 2000,
  polyline: "ozvbIfn_K?c@I]QIKUC]QEOOMYSK...."
%>

### Posts

`image_url` if provided defines the post image.

<%= json \
  caption: "This is my post content",
  created_at: "2017-07-31T05:35:33.000Z",
  team_id: 1234,
  page_id: 1234,
  charity_uid: "au-123",
  campaign_uid: "au-123",
  id: 1234,
  image_url: "https://deplyv9vomqtj.cloudfront.net/posts/images/783807...."
%>

### Charity / Event messages

`image_url` if provided defines the post image.

`caption` markdown string of the message.

<%= json \
  caption: "This is my post content",
  created_at: "2017-07-31T05:35:33.000Z",
  team_id: 1234,
  page_id: 1234,
  charity_uid: "au-123",
  campaign_uid: "au-123",
  id: 1234
%>
