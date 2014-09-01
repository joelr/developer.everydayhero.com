---
title: Teams
body_id: page_teams
---

* TOC
{:toc}

## List all Teams <small>(requires authentication)</small>

List all teams in the authenticated application's campaign.

    GET https://everydayhero.com/api/v2/teams

### Example

    https://everydayhero.com/api/v2/teams

### Response

<%= json :teams %>

## Create a Team <small>(requires authentication)</small>

* Must be created from an existing individual page

* Creates a Team, Team Page and sets individual page as team leader


      POST https://everydayhero.com/api/v2/teams

### Payload

individual_page_id : _required_ **integer**<br/>
The `id` of the individual page to create the team from.

name : _optional_ **string**<br/>
The name of the team. This needs to be unique within the campaign.

### Example

<%= json \
  individual_page_id: 1,
  name: "My New Team"
%>

### Response
<%= json :teampage %>
