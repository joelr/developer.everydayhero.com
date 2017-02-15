---
title: Authentication
body_id: partner_overview
---
There are three methods of authentication for the API:

### Registered Application Authentication

This endpoint is used for all endpoints which aren't scoped via OAuth, this is mostly limited to a few team related API requests. The majority of API requests can be authenticated with OAuth User Authentication (see below). The API
key for Registered App Auth is provided by EDH Professional Services, please email 
[api@everydayhero.com.au](mailto:api@everydayhero.com.au).

    $ curl -i -H "Authorization: Token token=your-token" https://everydayhero.com/api/v2

Authenticated API access is tied at the campaign level - this means that
any and all information created or updated can only take place within
the specified campaign.

For API actions that require a UID, users will be required to authenticate 
[via OAuth](/oauth-integration/#how-to-authenticate-with-edh) 
which provides a UID in the response.

## OAuth

<p class='notice'>To obtain your OAuth API key credentials, and for more details around OAuth endpoints for users flows take a look at 
<a href='/oauth-integration/#creating-an-oauth-application'>Creating an OAuth App</a></p>

### OAuth Client Authentication

This method of authentication is scoped at the OAuth application level. The majority of API requests are authenticated with OAuth user authentication below.

To fetch your Client API token, it requires doing the following request:

    POST /oauth/token?grant_type=client_credentials&client_id=x&client_secret=x

The retrieved token can be used in the following way

    $ curl -H "Authorization: Bearer <auth_token>" http://example.com

OR using a param of access_token=TOKEN on any request.

This will return JSON containing your OAuth Client token.

### OAuth User Authentication

After a user connection flow via OAuth, a token will be provided that will be
usuable on OAuth user scoped API calls. This authentication method is scoped by user and application.

Identical to OAuth App/Client auth, to use an OAuth User token, set an Authorization Token in this format

    $ curl -H "Authorization: Bearer <auth_token>" http://example.com

OR using a param of access_token=TOKEN on any request.
