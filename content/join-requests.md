---
title: Join Requests
body_id: page_teams
---
## Create a Join Request

<p class='info'><strong>Authentication types</strong>: Registered Application Token or OAuth User Token</p>

Join an existing team with an existing individual page.

    POST https://everydayhero.com/api/v2/teams/:id/join-requests

### Payload

individual_page_id : _required_ **integer**<br/>
The `id` of the page you want to join a team with.

<p class='info'>If using Registered Application authentication, any page in the application's campaign can be used. If using OAuth User authentication the affiliated user must own the page.</p>


### Example

<%= json \
  individual_page_id: 1
%>

### Response

<%= json :join_request %>
