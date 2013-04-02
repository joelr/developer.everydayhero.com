---
title: Join Requests
---

* TOC
{:toc}

## Create a Join Request

Join an existing team with an existing individual page.

    POST /teams/:id/join-requests

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

<%= json :join_request %>
