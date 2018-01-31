---
title: Custom Authentication Integration
body_id: partner_overview
---

* TOC
{:toc}

## Create a new user / Sign up

<p class='info'><strong>Authentication types</strong>: Public OAuth Client ID (Partner permissions)</p>

    POST https://everydayhero.com/api/v2/authentication/sign_up


Using this API you have to ensure that users have agreed to the everydayhero Terms of Service ([AU](https://everydayhero.com/au/terms), [NZ](https://everydayhero.com/nz/terms), [US](https://everydayhero.com/us/terms), [UK](https://everydayhero.com/uk/terms), [IE](https://everydayhero.com/ie/terms)).

### Payload

user[name] : _required_ **string**<br/>
The name of the new user.

user[email] : _required_ **string**<br/>
The email of the new user.

user[password] : _required_ **string**<br/>
The password of the new user.

user[phone] : _required_ **string**<br/>
The phone number of the new user.

country : _required_ **string**<br/>
The region of the new user, valid regions: AU, NZ, UK, US, IE.

client_id: _required_ **integer**<br/>
The client ID of the OAuth application.


The response will either be 201, 422 or a 404.

If the response is successful, the response will include a user OAuth token,
along with the user_id. This can be used with the [user endpoint](/users/#get-current-user)
to fetch the user details.

### Response

Success:

<%= json \
  token: 'abc',
  user_id: 123
%>

If the request failures, a hash of errors will be returned.
If the user tries to sign up with an existing email, the API will respond with a success if the provided password matches,
if not, a 422 with an related error will be returned.
A 404 will be returned if a country, or client_id is mising.

Failure:

<%= json \
  error: {
    message: "Validation failed",
    errors: [{
      field: "email",
      code: "invalid"
    }
    ]
  }
%>


## Authenticate a user / Login

<p class='info'><strong>Authentication types</strong>: Public OAuth Client ID</p>

    POST https://everydayhero.com/api/v2/authentication/sign_in

### Payload

user[email] : _required_ **string**<br/>
The email of the user.

user[password] : _required_ **string**<br/>
The password of the user.

client_id: _required_ **integer**<br/>
The client ID of the OAuth application.


The response will either be 200 or 404.

If the response is successful, the response will include a user OAuth token,
along with the user_id. This can be used with the [user endpoint](/users/#get-current-user)
to fetch the user details.
The response will be a 404 if the user details are incorrect, or the client_id is missing.

### Response

Success:

<%= json \
  token: 'abc',
  user_id: 123
%>

## Reset a user password

<p class='info'><strong>Authentication types</strong>: Public OAuth Client ID</p>

This API endpoint will trigger a password reset email for the specified user.

    POST https://everydayhero.com/api/v2/authentication/reset_password

### Payload

email : _required_ **string**<br/>
The email of the user.

client_id: _required_ **string**<br/>
The client ID of the OAuth application.

reference : _optional_ **string**<br/>
The campaign slug for the campaign which should be used for branding the reset password screen. It will also prefill the default `return_to` url for signup if no `return_to` param is supplied.

return_to : _optional_ **string**<br/>
A URL to redirect the user to after completing the reset password process. If not set it will default to BAU campaign signup for the user's country (or a campaign signup if `reference` is provided – see above).

The response will either be 204 or 404.

If the response is successful, the response will be a 204 no-content.
The response will be a 404 if the user email is invalid, or the client_id is missing.

## Single Sign On to Everydayhero

See [OAuth Integration](/oauth-integration#single-sign-on-to-everydayhero)
