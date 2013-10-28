---
title: Teams
---

* TOC
{:toc}

## List all Teams

List all teams in the authenticated application's campaign.

    GET https://everydayhero.com/api/v2/teams

### Visibility

Restricted. Requires an authenticated user.

### Example

    https://everydayhero.com/api/v2/teams

### Response

<%= json :team %>

## Create a Team


* Must be created from an existing individual page

* Creates a Team, Team Page and sets individual page as team leader


      POST https://everydayhero.com/api/v2/teams

### Visibility

Restricted. Requires an authenticated user.

### Payload

`individual_page_id`
: _Required_ **integer**. The `id` of the individual page to create the
team from.

name
: _Optional_ **string**. The name of the team. This needs to be unique
within the campaign.

### Example

<%= json \
  individual_page_id: 1,
  name: "My New Team"
%>

### Response
<%= json :teampage %>
