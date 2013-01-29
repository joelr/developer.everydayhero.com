---
title: Pages
---

## List all User Pages

## View a single Page (Individual or Team)

```
GET /pages/:id
```

### Visibility

Public.

### Response

TODO: add response

## Create an Individual Page

```
POST /pages
```

### Visibility

Restricted. Requires an authenticated user.

### Payload

slug
: _Optional_ **string**. The desired url for your new supporter page.
https://give.everydayhero.com/au/tim-cooper.
expires_at
: _Required_ **datetime**. The date and time you want the page to
expire.
target
: _Optional_ **string**. The dollar amount that you are aiming to raise.
birthday
: _Optional_ **string**. Your birthday. In some countries there are age
restrictions on fundraising and further action might need to be taken
depending on the age provided. Defaults (and prefers) the age supplied
for your user.
gift_aid_eligible
: _Optional_ **boolean**. UK specific fundraising criteria.

``` json
{
  "url": "tim-cooper",
  "expires_at": "2013-10-21T17:15:08+10:00",
  "target": "500.50",
  "birthday": "1987-04-16T00:00:00+10:00",
  "gift_aid_eligible": null
}
```

### Response

TODO: add response
