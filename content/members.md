---
title: Members
---
## Add a Team Member <small>(requires authentication)</small>

Add an existing page to an existing team.

    POST https://everydayhero.com/api/v2/teams/:id/members

### Payload

<div>individual_page_id : _required_ **integer**</div>
<div>The `id` of the page you want to join a team with.</div>

### Example

<%= json \
  individual_page_id: 1
%>

### Response

<%= json :team %>
