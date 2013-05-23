---
title: Members
---
## Add a Team Member

Add an existing page to an existing team.

    POST /teams/:id/members

### Visibility

Restricted. Requires an authenticated user.

### Payload

individual_page_id
: _Required_ **integer**. The `id` of the page you want to join a team
with.

<%= json \
  individual_page_id: 1
%>

### Response

<%= json :team %>
