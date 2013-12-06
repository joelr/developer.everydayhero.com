---
title: Members
---
## Add a Team Member <small>(requires authentication)</small>

Add an existing page to an existing team.

    POST https://everydayhero.com/api/v2/teams/:id/members

### Parameters

#### URL

id : _required_ **string**<br/>
The team `uid`.

#### POST

individual_page_id : _required_ **integer**<br/>
The `id` of the page you want to join a team with.

### Example

<%= json \
  individual_page_id: 1
%>

### Response

<%= json :team %>
