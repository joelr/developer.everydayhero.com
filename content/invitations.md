---
title: Invitations
---

* TOC
{:toc}

## Create Invitations

Because of the nature of invitations this is a bulk commit resource
which means that passing several recipients will create several
invitations.

    POST /invitations

### Visibility

Restricted. Requires an authenticated user.

### Payload

team_page_id
: _Required_ **integer**. The `id` of the team page that you want to
create invitations for.

recipients
: _Required_ **array**. An array of email addresses to create
invitations for.

<%= json \
  team_page_id: 1,
  recipients: ['support@everydayhero.com']
%>

### Response

TODO: add response
