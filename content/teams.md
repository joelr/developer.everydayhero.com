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

TODO: add response
