---
title: Teams
---

* TOC
{:toc}

## List all Teams <small>(requires authentication)</small>

List all teams in the authenticated application's campaign.

    GET https://everydayhero.com/api/v2/teams

### Example

    https://everydayhero.com/api/v2/teams

### Response

<%= json :team %>

## Create a Team <small>(requires authentication)</small>

* Must be created from an existing individual page

* Creates a Team, Team Page and sets individual page as team leader


      POST https://everydayhero.com/api/v2/teams

### Payload

<div>`individual_page_id` : _required_ **integer**</div>
<div>The `id` of the individual page to create the team from.</div>

<div>name : _optional_ **string**</div>
<div>The name of the team. This needs to be unique within the campaign.</div>

### Example

<%= json \
  individual_page_id: 1,
  name: "My New Team"
%>

### Response
<%= json :teampage %>
