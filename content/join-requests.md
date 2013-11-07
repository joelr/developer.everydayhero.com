---
title: Join Requests
---
## Create a Join Request <small>([requires authentication](/overview/#authentication))</small>

Join an existing team with an existing individual page.

    POST https://everydayhero.com/api/v2/teams/:id/join-requests

### Payload

individual_page_id : _required_ **integer**<br/>
The `id` of the page you want to join a team with.

### Example

<%= json \
  individual_page_id: 1
%>

### Response

<%= json :join_request %>
