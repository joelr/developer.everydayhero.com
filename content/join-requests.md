---
title: Join Requests
---
## Create a Join Request <small>(requires authentication)</small>

Join an existing team with an existing individual page.

    POST https://everydayhero.com/api/v2/teams/:id/join-requests

### Payload

<div>individual_page_id : _required_ **integer**</div>
<div>The `id` of the page you want to join a team with.</div>

### Example

<%= json \
  individual_page_id: 1
%>

### Response

<%= json :join_request %>
