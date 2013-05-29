---
title: Teams
---
## Create a Team


* Must be created from an existing individual page

* Creates a Team, Team Page and sets individual page as team leader


      POST /teams

### Visibility

Restricted. Requires an authenticated user.

### Payload

`individual_page_id`
: _Required_ **integer**. The `id` of the individual page to create the
team from.

name
: _Optional_ **string**. The name of the team. This needs to be unique
within the campaign.

<%= json \
  individual_page_id: 1,
  name: "My New Team"
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
