---
title: OAuth Integration
---

* TOC
{:toc}

One of the biggest questions we receive from developers is around end to
end integration - the API is great for pushing and pulling information
but what if I want to create a tighter experience with Everyday Hero?

Everyday Hero offer several integration points with third party software
- the two that will be described in detail will firstly be
authentication and secondly registration before creating supporter
pages.

## Why integrate with EDH Passport

* Ability to gain more detailed information on users because you can
leverage any information provided by Everyday Hero

* Build upon data provided by Everyday Hero to customise an experience
for you users

* Global user identification. Once authenticated you will be given a
universal identifier (uid) which is our guarantee to you that this is
the same user within Everyday Hero and your product. This is especially
useful for year on year campaigns.


## How to Authenticate with EDH Passport

Everyday Hero's Giving Passport is our way of globally recognising a
user within any one of our products. We are now opening this
functionality for other developers to leverage. We are using the same
technology that powers Twitter and Facebook: OAuth2. Because this has
predominately been an internal tool there is no user interface for
creating and managing your OAuth applications but if you contact
[support](mailto:support@everydayhero.com) we can get you underway.

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

    GET    passport.edheroz.com/oauth/authorize(.:format)

The authorization endpoint is defined in the OAuth 2.0 specification
and is used by OAuth to interact with resource owners, authenticate
them, and obtains their authorization. An OAuth client makes an
authorization request by directing the user to the authorization endpoint.
After completing its interaction with the user, the OAuth/Passport
service redirects the useZ back to the client’s redirect URI with the
response to the authorization request.

####Example:
    https://passport.edheroz.com/oauth/authorize?response_type=code&client_id=XXXX&redirect_uri=http://MYAPP.COM/auth/passport/callback&email=john@smith.com

### Parameters & prepopulation

response_type
: _Required_ **string** A value of code results in the Authorization Code
grant type while a value of token implies the Implicit grant type.

client_id
: _Required_ **string** The client identifier.

redirect_uri
: _Optional_ **string** If present, the requested redirect_uri must match
the one configured for the client.

email
: _Optional_ **string**. The email of the person you want to prepopulate
the sign-up form for.

phone
: _Optional_ **string**. The phone number of the person you want to
prepopulate the sign-up form for.

name
: _Optional_ **string**. The full name of the person you want to
prepopulate the sign-up form for.

reference
: _Optional_ **string**. The reference of the [Sign-in branding](/branding/)
given to display on the sign-in form if the person is asked to sign-in.

## Token endpoint

    POST   passport_host/oauth/token

The token endpoint is the endpoint on the authorization server where the
client application exchanges the authorization code, client ID and client
secret, for an access token.

####Example:
    POST passport_host/oauth/token?code=CODE&client_id=XXXX&client_secret=XXXX&grant_type=authorization_code&redirect_uri=http://myapp.com:3000/auth/passport/callback

### Parameters & prepopulation

grant_type
: _Required_ **string** use authorization_code

client_id
: _Required_ **string** The client identifier.

client_secret
: _Required_ **string** If present, the requested redirect_uri must match
the one configured for the client.

code
: _Required_ **string**.

redirect_uri
: _Required_ **string** the requested redirect_uri must match
the one configured for the client.

### Response

<%= json :tokendata %>

## Registration Product Integration

A [sample application](http://example-rego-integration.herokuapp.com) has been
built to show one possible end to end third party registration scenario.
Source code for the application can be found on
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
[support](mailto:support@everydayhero.com).

Generally there are going to be two entry points into your campaign, the
first will be through your website and the second will be through an
Everyday Hero supporter page. The two flows are slightly different and
deserve separate discussions.


