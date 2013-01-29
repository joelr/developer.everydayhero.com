---
title: Pages
---

* TOC
{:toc}

## List all Pages

    GET /pages

### Visibility

Public.

### Response

TODO: add response

## View a single Page

    GET /pages/:id

### Visibility

Public.

### Response

TODO: add response

## Create an Individual Page

    POST /pages

### Visibility

Restricted. Requires an authenticated user.

### Payload

slug
: _Optional_ **string**. The desired url for your new supporter page.
https://give.everydayhero.com/au/tim-cooper.

expires_at
: _Required_ **string**. The date and time you want the page to
expire. ISO8601 format.

target
: _Optional_ **string**. The dollar amount that you are aiming to raise.

uid
: _Required_ **integer**. The `uid` of the user that you want to create
a page for.

birthday
: _Optional_ **string**. Your birthday. In some countries there are age
restrictions on fundraising and further action might need to be taken
depending on the age provided. Defaults (and prefers) the age supplied
for your user.

charity_id
: _Optional_ **string**. The `id` of the charity to create the page for.
In a single charity campaign this will be defaulted and in multi
charity campaigns a random charity will be chosen if no `id` is
provided.

gift_aid_eligible
: _Optional_ **boolean**. UK specific fundraising criteria.

<%= json \
  slug: "tim-cooper",
  expires_at: "2013-10-21T17:15:08+10:00",
  target: "500.50",
  birthday: "1987-04-16T00:00:00+10:00",
  gift_aid_eligible: nil,
  uid: 1,
  charity_id: 'au-1'
%>

### Response

TODO: add response
