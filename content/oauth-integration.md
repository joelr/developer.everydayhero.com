---
title: OAuth Integration
---

* TOC
{:toc}

## How to Authenticate with EDH

everydayhero's OAuth account is our way of globally recognising a
user within any one of our products. We are now opening this
functionality for other developers to leverage. We are using the same
technology that powers Twitter and Facebook: OAuth2. You can get started with your own 
OAuth application below.

## Creating an OAuth Application

You can create your own OAuth app by creating an OAuth app and going to:

[Manage API Applications at everydayhero.com/developers](http://everydayhero.com/developers/oauth_applications)


This application will give you access to all OAuth scoped endpoints. If you 
require access to authenticated non-OAuth calls, please contact 
[Professional Services](mailto:api@everydayhero.com) for
credentials.

By default new applications require an Authorization screen, shown below.
Similar to other OAuth applications (Twitter, Facebook etc), this allows users
to either accept the connection or Deny.
![Authorization Screen](/images/permission.png)

If your integration requires the authorization screen to be skipped, contact 
[Professional Services](mailto:api@everydayhero.com) and
the application will be reviewed.

## OAuth Integration Libraries

Integrating OAuth2 into any modern system should be fairly simple.
everydayhero have written (and maintain) the ruby client for
interfacing with the EDH OAuth accounts and it can be found on
[GitHub](https://github.com/everydayhero/omniauth-passport). A quick
google for your language / framework and OAuth2 should yield the best
library for you.

Various clients for supporting OAuth 2 in your language of choice are
available at [http://oauth.net/2/](http://oauth.net/2/).

By authenticating with the EDH OAuth account you are guaranteed that the
user you are dealing with will be the same person that is represented
in any everydayhero product.


## Authentication endpoints

Ideally your library of choice will handle the following for you, however 
if you would like to make use of the custom parameters, see the endpoints below.

### Authorize endpoint

    GET    https://passport.everydayhero.com/oauth/authorize(.:format)

The authorization endpoint is defined in the OAuth 2.0 specification
and is used by OAuth to interact with resource owners, authenticate
them, and obtains their authorization. An OAuth client makes an
authorization request by directing the user to the authorization endpoint.
After completing its interaction with the user, the OAuth
service redirects the user back to the client’s redirect URI with the
response to the authorization request.

####Example:
    https://passport.everydayhero.com/oauth/authorize?response_type=code&client_id=XXXX&redirect_uri=http://MYAPP.COM/auth/passport/callback&email=john@smith.com

#### Parameters

response_type : _required_ **string**<br/>
A value of code results in the Authorization Code grant type while a value of token implies the Implicit grant type.

The recommended response_type is token, which requires using the Token endpoint to fetch the user Bearer Token after returning an auth code. However, if you are developing a client side application, use the response_type of code, this will return a Bearer Token in the URL hash of the redirect_uri provided.

client_id : _required_ **string**<br./>
The client identifier.

redirect_uri : _optional_ **string**<br/>
If present, the requested redirect_uri must match the one configured for the client. if the redirect_uri is set to ```urn:ietf:wg:oauth:2.0:oob```, this will tell EDH to display the authorization code instead of redirecting to a client application (if this is still under development).

force : _optional_ **boolean**<br/>
If set as true, this will force the user to sign up/sign in. If this is not set, and a user is signed in, the user will automatically continue their OAuth flow without requiring sign in.

#### Prepopulation

These parameters will be pre-populated on the sign up/in screen.

email : _optional_ **string**<br/>
The email of the person you want to prepopulate the sign-up form for.

phone : _optional_ **string**<br/>
The phone number of the person you want to prepopulate the sign-up form for.

name : _optional_ **string**<br/>
The full name of the person you want to prepopulate the sign-up form for.

login_action : _optional_ **string**<br/>
Set it to `sign-in` to be redirected to the sign-in form instead of the regular sign-up form.

#### Branding

Branding is optional.

These parameters are only required if you would like branding from your campaign to be used for the sign up/in screen. If you choose to implement branding, both parameters are required.

reference : _optional_ **string**<br/>
The campaign slug for the campaign which should be used for branding the login screen.

country : _optional_ **string**<br/>
The country code associated with your campaign (au, nz, uk).

#### Response

<%= json :authorizedata %>

## Token endpoint

    POST   https://passport.everydayhero.com/oauth/token

The token endpoint is the endpoint on the authorization server where the
client application exchanges the authorization code, client ID and client
secret, for an access token.

####Example:
    POST https://passport.everydayhero.com/oauth/token?code=CODE&client_id=XXXX&client_secret=XXXX&grant_type=authorization_code&redirect_uri=http://myapp.com:3000/auth/passport/callback

### Parameters

grant_type : _required_ **string**<br/>
Use authorization_code.

client_id : _required_ **string**<br/>
The client identifier.

client_secret : _required_ **string**<br/>
The client secret.

code : _required_ **string**<br/>
The code returned from authorize endpoint.

redirect_uri : _required_ **string**<br/>
The requested redirect_uri must match the one configured for the client.

### Response

<%= json :tokendata %>

## Single Sign On to Everydayhero

<p class='info'><strong>Authentication types</strong>: OAuth User Token </p>

After the OAuth Flow, a Third party application obtains a token to perform some changes on behalf of a user.
E.g: create a Supporter Page.

However, by default this user is not authenticated on Everydayhero's website. A third party application can create a form which posts at the URL below to sign the user in Everydayhero before to redirect them.

    POST https://everydayhero.com/api/v2/authentication/sessions

### Payload

access_token : _required_ **string**<br/>
The token obtained during the OAuth Flow.

return_to : _optional_ **string**<br/>
The URL the end point will redirect to once the authentication is done. Default when unprovided is the user's Dashboard.

## Registration Product Integration

A [sample application](http://example-rego-integration.herokuapp.com) has been
built to show one possible end to end third party registration scenario.
Source code for the application can be found on
[GitHub](https://github.com/everydayhero/example_registrations).
This application demonstrates:

* authentication with EDH
* using the everydayhero API to create a supporter page and view
information on the campaign
* while still giving you ultimate control over your registration system

For this type of integration you will need the following:

* An OAuth2 application
* An API key
* Registering a third party integration application

All of this can be obtained by emailing
[support](mailto:api@everydayhero.com).

Generally there are going to be two entry points into your campaign, the
first will be through your website and the second will be through an
everydayhero supporter page. The two flows are slightly different and
deserve separate discussions.


