---
title: Pages
---

* TOC
{:toc}

A page can belong to either a user or team (denoted by the 'owner_type' field).
Pages belonging to a team have some special characteristics in that some of its
fields represent an agregate of all its team members. Fields which have this
characteristic include 'amount' and 'custom_metric_total'.

## List all Pages <small>(public)</small>

    GET https://everydayhero.com/api/v2/pages

### Parameters

ids : _optional_ **string**<br/>
Only retrieve pages with the ids specified. `1,5,20` will retrieve pages with the ids 1, 5 and 20.

type : _optional_ **string**<br/>
The types of pages that are required. Supported values include `all`, `individual` and `team`. Defaults to `all`.

campaign_id : _optional_ **string**<br/>
Only retrieve pages participating in the campaign specified.

charity_ids : _optional_ **string**<br/>
Only retrieve pages supporting the specified charities. For example `au-1,au-5`
will retrieve pages which support charity ids `au-1` and `au-5`.

start_updated_at : _optional_ **string**<br/>
Only retrieve pages that have been updated after the supplied date/time.
Format, 'YYYY-MM-DDThh:mm:ssZ'

end_updated_at : _optional_ **string**<br/>
Only retrieve pages that have been updated before the supplied datetime.
Format, 'YYYY-MM-DDThh:mm:ssZ', timestamp optional

start_created_at : _optional_ **string**<br/>
Only retrieve pages that have been created after the supplied date/time.
Format, 'YYYY-MM-DDThh:mm:ssZ'

end_created_at : _optional_ **string**<br/>
Only retrieve pages that have been created before the supplied datetime.
Format, 'YYYY-MM-DDThh:mm:ssZ', timestamp optional

#### Pagination

For more information about pagination, please see the [pagination
overview](/overview/#pagination).

limit : _optional_ **integer**<br/>
The number of items per page.

page : _optional_ **integer**<br/>
The page number to return.

### Example

    https://everydayhero.com/api/v2/pages.json?type=individual&campaign_id=au-1&charity_ids=au-1,au-5

### Response

<%= json :pages %>

## View a single Page <small>(public)</small>

    GET https://everydayhero.com/api/v2/pages/PAGE_ID_OR_UUID

The single page lookup includes expanded data including more granular total values.

You can also access a page API endpoint (via a redirect), by appending .json to the end of a URL

### Example
    https://givingtuesday2014.everydayhero.com/au/joel.json

redirects to

    https://everydayhero.com/api/v2/pages/877323

### Example

    https://everydayhero.com/api/v2/pages/1.json

### Response

<%= json :expanded_page_data %>

## Create an Individual Page

<p class='info'><strong>Authentication types</strong>: Registered Application Token or OAuth User Token</p>

    POST https://everydayhero.com/api/v2/pages

### Payload

uid : _required_ **integer**<br/>
The `uid` of the user that you want to create a page for.

<p class='info'>uid is only required if Registered Application Token authentication is being used, otherwise the relevant user affiliated to the token will be used.</p>

birthday : _required_ **string**<br/>
Your birthday, format "YYYY-MM-DD". In some countries there are age restrictions on fundraising and further action might need to be taken depending on the age provided.

charity_id : _optional_ **string**<br/>
The `id` of the charity to create the page for. A charity will be system nominated if there is none specified.

campaign_id : _required_ **string**<br/>
The `id` of the campaign to create the page for.

<p class='info'>campaign_id is only required if OAuth User Token authentication is being used, otherwise the registered application's campaign will be used.</p>


image : _optional_ **string** <br/>
The URL of the image that will be uploaded as the page's default image.

name : _optional_ **string**<br/>
The desired name for your new supporter page. Defaults to the user's preferred name.

slug : _optional_ **string**<br/>
A URL-friendly version of the name parameter. Can only contain lower case characters, numbers, and hyphens. The slug will form part of the page URL and must be unique within the campaign. Maximum 60 characters.

expires_at : _optional_ **string**<br/>
The date and time you want the page to expire. ISO8601 format. Defaults to 1 month after the campaign end date.

target : _optional_ **string**<br/>
The dollar amount that you are aiming to raise (must be above 0).

token : _optional_ **string**<br/>
An invitation token to join a team. This invitation was created by the team leader and sent to the user that you want to create a supporter page for.

gift_aid_eligible : _optional_ **boolean**<br/>
UK specific fundraising criteria.

group_values : _optional_ **Hash/Array**<br/>
If a campaign has group values available, these can be set, see the payload below for an example.

skip_notification: _optional_ **boolean**<br/>
This skips sending the everydayhero page creation email if set as `true`, defaults to `false`.

### Example

<%= json \
  name: "Tim",
  slug: "tim",
  expires_at: "2013-10-21T17:15:08+10:00",
  target: "500.50",
  birthday: "1987-04-16T00:00:00+10:00",
  gift_aid_eligible: nil,
  uid: 1,
  charity_id: 'au-1',
  token: '1234567890',
  group_values: {
    school: 'Abc',
    state: 'QLD'
  }
%>

### Response

<%= json :created_page %>
