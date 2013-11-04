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

### Example

    https://everydayhero.com/api/v2/pages.json?type=individual&campaign_id=au-1

### Response

<%= json :pages %>

## View a single Page <small>(public)</small>

    GET https://everydayhero.com/api/v2/pages/:id

[View demo in API console](/console/?query=pages/1.json)

### Example

    https://everydayhero.com/api/v2/pages/1.json

### Response

<%= json :page %>

## Create an Individual Page <small>([requires authentication](/overview/#authentication))</small>

    POST https://everydayhero.com/api/v2/pages

### Payload

uid : _required_ **integer**<br/>
The `uid` of the user that you want to create a page for.

birthday : _required_ **string**<br/>
Your birthday. In some countries there are age restrictions on fundraising and further action might need to be taken depending on the age provided.

name : _optional_ **string**<br/>
The desired name for your new supporter page. Defaults to the user's preferred name.

slug : _optional_ **string**<br/>
The desired url for your new supporter page. https://give.everydayhero.com/au/tim-cooper.

expires_at : _optional_ **string**<br/>
The date and time you want the page to expire. ISO8601 format. Defaults to 1 month after the campaign end date.

target : _optional_ **string**<br/>
The dollar amount that you are aiming to raise (must be above 0).

charity_id : _optional_ **string**<br/>
The `id` of the charity to create the page for. Defaulted to a random charity.

token : _optional_ **string**<br/>
An invitation token to join a team. This invitation was created by the team leader and sent to the user that you want to create a supporter page for.

gift_aid_eligible : _optional_ **boolean**<br/>
UK specific fundraising criteria.

### Example

<%= json \
  slug: "tim-cooper",
  expires_at: "2013-10-21T17:15:08+10:00",
  target: "500.50",
  birthday: "1987-04-16T00:00:00+10:00",
  gift_aid_eligible: nil,
  uid: 1,
  charity_id: 'au-1',
  token: '1234567890'
%>

### Response

<%= json :created_page %>
