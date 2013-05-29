---
title: Pages
---

* TOC
{:toc}

## List all Pages

    GET /pages

### Visibility

Public.

### Parameters

ids
: _Optional_ **string**. Only retrieve pages with the ids specified.
`1,5,20` will retrieve pages with the ids 1, 5 and 20.

type
: _Optional_ **string**. The types of pages that are required. Supported
values include `all`, `individual` and `team`. Defaults to `all`.

campaign_id
: _Optional_ **string**. Only retrieve pages participating in the
campaign specified.

### Response

<%= json :pages %>

## View a single Page

    GET /pages/:id

### Visibility

Public.

### Response

<%= json :page %>

## Create an Individual Page

    POST /pages

### Visibility

Restricted. Requires an authenticated user.

### Payload

uid
: _Required_ **integer**. The `uid` of the user that you want to create
a page for.

birthday
: _Required_ **string**. Your birthday. In some countries there are age
restrictions on fundraising and further action might need to be taken
depending on the age provided.

name
: _Optional_ **string**. The desired name for your new supporter page.
Defaults to the user's preferred name.

slug
: _Optional_ **string**. The desired url for your new supporter page.
https://give.everydayhero.com/au/tim-cooper.

expires_at
: _Optional_ **string**. The date and time you want the page to
expire. ISO8601 format. Defaults to 1 month after the campaign end date.

target
: _Optional_ **string**. The dollar amount that you are aiming to raise.

charity_id
: _Optional_ **string**. The `id` of the charity to create the page for.
Defaulted to a random charity.

token
: _Optional_ **string**. An invitation token to join a team. This
invitation was created by the team leader and sent to the user that you
want to create a supporter page for.

gift_aid_eligible
: _Optional_ **boolean**. UK specific fundraising criteria.

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

<%= json \
  {
    "page": {
      "amount": {
        "cents": 0,
        "currency": {
          "iso_code": "AUD",
          "name": "Australian Dollar",
          "symbol": "$"
        }
      },
      "cached_offline_amount_cents": 0,
      "campaign_uid": "au-1419",
      "charity_uid": "au-6",
      "expires_at": "2013-08-29T14:00:00Z",
      "gift_aid_eligible": false,
      "id": 1513,
      "invitation_id": null,
      "name": "Team  Tim",
      "owner_type": "Team",
      "owner_uid": 211,
      "slug": "team-tim",
      "state": "active",
      "target_cents": 70000,
      "team_leader_page_uid": 1511,
      "team_member_uids": [
        1511
      ],
      "team_uid": null,
      "uid": 1513
    }
  }
%>
