---
title: Teams
body_id: page_teams
---

* TOC
{:toc}

## List all Teams

<p class='info'><strong>Authentication types</strong>: Registered Application Token or OAuth User Token</p>

List all teams in the authenticated application's campaign if using Registered Application authentication, or all the user's teams if using OAuth User authentication.

    GET https://everydayhero.com/api/v2/teams

### Params

start_updated_at : _optional_ **string**<br/>
Only retrieve pages that have been updated after the supplied date/time.
Format, 'YYYY-MM-DDThh:mm:ssZ'

end_updated_at : _optional_ **string**<br/>
Only retrieve pages that have been updated before the supplied datetime.
Format, 'YYYY-MM-DDThh:mm:ssZ', timestamp optional

start_created_at : _optional_ **string**<br/>
Only retrieve pages that have been created after the supplied date/time.
Format, 'YYYY-MM-DDThh:mm:ssZ'

end_created_at : _optional_ **string**<br/>
Only retrieve pages that have been created before the supplied datetime.
Format, 'YYYY-MM-DDThh:mm:ssZ', timestamp optional

### Example

    https://everydayhero.com/api/v2/teams

### Response

<%= json :teams %>

## View a single team

<p class='info'><strong>Authentication types</strong>: Registered Application Token or OAuth User Token</p>

Get a specific team in the authenticated application's campaign if using a Registered Application authentication, or in the user's teams if using OAuth User authentication.

### Example

    GET https://everydayhero.com/api/v2/teams/:id

### Response

<%= json :team %>

## Create a Team

<p class='info'><strong>Authentication types</strong>: Registered Application Token or OAuth User Token</p>

* Must be created from an existing individual page

Creates a team with team page, and assigns the existing individual page (specified by the `individual_page_id` parameter) as the team leader.


      POST https://everydayhero.com/api/v2/teams

### Payload

individual_page_id : _required_ **integer**<br/>
The `id` of the individual page which will become the team leader. This page must already exist.

<p class='info'>If using Registered Application authentication, any team in the application's campaign can be used. If using OAuth User authentication the affiliated user must own the team.</p>

name : _optional_ **string**<br/>
The name of the team. This needs to be unique within the campaign.

### Example

<%= json \
  individual_page_id: 1,
  name: "My New Team"
%>

### Response
<%= json :teampage %>
