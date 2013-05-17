---
title: Invitations
---
## Create Individual Page Invitation

Send an invitation to create an individual supporter page to an email
address.

    POST /individual-pages/invitations

### Visibility

Restricted. Requires an authenticated user.

### Payload

email
: _Required_ **string**. The email address you would like the invitation
sent to. We do not tie this email address to the user's Giving Passport
in any way, it is only used to deliver the invitation.

phone
: _Optional_ **string**. The phone number of the person you want to
invite to create a supporter page.

full_name
: _Optional_ **string**. The full name of the person you want to invite
to create a supporter page.

charity_id
: _Optional_ **string**. The `id` of the charity that you want set for
this supporter page. If no charity is supplied the user will be prompted
to select a charity. Defaults to none.

target
: _Optional_ **decimal**. The amount of money this page is aiming to
raise. Defaults to a predetermined value.

<%= json \
  email: 'support@everydayhero.com',
  phone: '1300798768',
  full_name: 'Everyday Hero Support',
  charity_id: 'au-1',
  target: 705.5
%>

### Response

<%= json :create_individual_page_invitation %>

## Create Join a Team Invitation

Send an invitation to create an individual supporter page for a team to
an email address.

    POST /team-pages/:team_page_id/invitations

### Visibility

Restricted. Requires an authenticated user.

### Payload

email
: _Required_ **string**. The email address you would like the invitation
sent to. We do not tie this email address to the user's Giving Passport
in any way, it is only used to deliver the invitation.

full_name
: _Optional_ **string**. The full name of the person you want to invite
to create a supporter page.

charity_id
: _Optional_ **string**. The `id` of the charity that you want set for
this supporter page. If no charity is supplied the user will be prompted
to select a charity. Defaults to none.

target
: _Optional_ **decimal**. The amount of money this page is aiming to
raise. Defaults to a predetermined value.

<%= json \
  email: 'support@everydayhero.com',
  full_name: 'Everyday Hero Support',
  charity_id: 'au-1',
  target: 705.5
%>

### Response

<%= json :join_team_invitation %>
