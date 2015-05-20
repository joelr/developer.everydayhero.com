---
title: Authentication
---
There are three methods of authentication for the API:

### Registered Application Authentication

This endpoint is used for all endpoints which aren't scoped via OAuth. This API
key is the key provided by EDH Professional Services.

    $ curl -i -H "Authorization: Token token=your-token" https://everydayhero.com/api/v2

Authenticated API access is tied at the campaign level - this means that
any and all information created or updated can only take place within
the specified campaign.

For API actions that require a UID, users will be required to authenticate 
[via OAuth](/oauth-integration/#how-to-authenticate-with-edh-passport) 
which provides a UID in the response.

To obtain an API key for this method of authentication, please email 
[api@everydayhero.com.au](mailto:api@everydayhero.com.au).

## OAuth

To obtain your OAuth API key credentials, take a look at 
[Creating an OAuth App](/oauth-integration/#creating-an-oauth-application)

### OAuth Client Authentication

To fetch your Client API token, it requires doing the following request:

    POST /oauth/token?grant_type=client_credentials&client_id=x&client_secret=x

The retrieved token can be used in the following way

    $ curl -H "Authorization: Bearer <auth_token>" http://example.com

OR using a param of access_token=TOKEN on any request.

This will return JSON containing your OAuth Client token.

### OAuth User Authentication

After a user connection flow via OAuth, a token will be provided that will be
usuable on OAuth user scoped API calls.

Identical to OAuth App/Client auth, to use an OAuth User token, set an Authorization Token in this format

    $ curl -H "Authorization: Bearer <auth_token>" http://example.com

OR using a param of access_token=TOKEN on any request.
