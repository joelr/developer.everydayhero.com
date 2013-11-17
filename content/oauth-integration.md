---
title: OAuth Integration
---

* TOC
{:toc}

## How to Authenticate with EDH Passport

Everyday Hero's Giving Passport is our way of globally recognising a
user within any one of our products. We are now opening this
functionality for other developers to leverage. We are using the same
technology that powers Twitter and Facebook: OAuth2. Because this has
predominately been an internal tool there is no user interface for
creating and managing your OAuth applications but if you contact
[Professional Services](mailto:professionalservices@everydayhero.com.au)
we can get you underway.

Integrating OAuth2 into any modern system should be fairly simple.
Everyday Hero have written (and maintain) the ruby client for
interfacing with the Giving Passport and it can be found on
[GitHub](https://github.com/everydayhero/omniauth-passport). A quick
google for your language / framework and OAuth2 should yield the best
library for you.

Various clients for supporting OAuth 2 in your language of choice are
available at [http://oauth.net/2/](http://oauth.net/2/).

By authenticating with the Giving Passport you are guaranteed that the
user you are dealing with will be the same person that is represented
in any Everyday Hero product.

The endpoints are:

## Authorize endpoint

    GET    https://passport.everydayhero.com/oauth/authorize(.:format)

The authorization endpoint is defined in the OAuth 2.0 specification
and is used by OAuth to interact with resource owners, authenticate
them, and obtains their authorization. An OAuth client makes an
authorization request by directing the user to the authorization endpoint.
After completing its interaction with the user, the OAuth/Passport
service redirects the user back to the client’s redirect URI with the
response to the authorization request.

####Example:
    https://passport.everydayhero.com/oauth/authorize?response_type=code&client_id=XXXX&redirect_uri=http://MYAPP.COM/auth/passport/callback&email=john@smith.com

### Parameters

<div>response_type : _required_ **string**</div>
<div>A value of code results in the Authorization Code grant type while a value
of token implies the Implicit grant type.</div>

<div>client_id : _required_ **string**</div>
<div>The client identifier.</div>

<div>redirect_uri : _optional_ **string**</div>
<div>If present, the requested redirect_uri must match the one configured for
the client. if the redirect_uri is set to ```urn:ietf:wg:oauth:2.0:oob```, this
will tell Passport to display the authorization code instead of redirecting to a
client application (if this is still under development).</div>

### Prepopulation

These parameters will be pre-populated on the sign up/in screen.

<div>email : _optional_ **string**</div>
<div>The email of the person you want to prepopulate the sign-up form for.</div>

<div>phone : _optional_ **string**</div>
<div>The phone number of the person you want to prepopulate the sign-up form
for.</div>

<div>name : _optional_ **string**</div>
<div>The full name of the person you want to prepopulate the sign-up form
for.</div>

### Branding

Branding is optional.

These parameters are only required if you would like branding from your campaign to be used for the sign up/in screen. If you choose to implement branding, both parameters are required.

<div>reference : _optional_ **string**</div>
<div>The campaign slug for the campaign which should be used for branding the
login screen.</div>

<div>country : _optional_ **string**</div>
<div>The country code associated with your campaign (au, nz, uk).</div>

### Response

<%= json :authorizedata %>

## Token endpoint

    POST   https://passport.everydayhero.com/oauth/token

The token endpoint is the endpoint on the authorization server where the
client application exchanges the authorization code, client ID and client
secret, for an access token.

####Example:
    POST https://passport.everydayhero.com/oauth/token?code=CODE&client_id=XXXX&client_secret=XXXX&grant_type=authorization_code&redirect_uri=http://myapp.com:3000/auth/passport/callback

### Parameters

<div>grant_type : _required_ **string**</div>
<div>Use authorization_code.</div>

<div>client_id : _required_ **string**</div>
<div>The client identifier.</div>

<div>client_secret : _required_ **string**</div>
<div>The client secret.</div>

<div>code : _required_ **string**</div>
<div>The code returned from authorize endpoint.</div>

<div>redirect_uri : _required_ **string**</div>
<div>The requested redirect_uri must match the one configured for the
client.</div>

### Response

<%= json :tokendata %>

## Registration Product Integration

A sample application has been built to show one possible end to end third party
registration scenario. Source code for the application can be found on
[GitHub](https://github.com/everydayhero/example_registrations).
This application demonstrates:

* authentication with the Giving Passport
* using the Everyday Hero API to create a supporter page and view
information on the campaign
* while still giving you ultimate control over your registration system

For this type of integration you will need the following:

* An OAuth2 application
* An API key
* Registering a third party integration application

All of this can be obtained by emailing
[support](mailto:professionalservices@everydayhero.com.au).

Generally there are going to be two entry points into your campaign, the
first will be through your website and the second will be through an
Everyday Hero supporter page. The two flows are slightly different and
deserve separate discussions.
