---
title: Users
---

* TOC
{:toc}

## List all Users

    GET https://passport.everydayhero.com/api/v1/users

### Visibility

Restricted. Requires an authenticated user via access_token parameter.

### Parameters

search : _optional_ **string**<br/>
Retrieve only the users with either a name, nickname or email matching the provided keyword(s).

### Example

    https://passport.everydayhero.com/api/v1/users.json

### Response

<%= json :users %>

## Get current user

    GET https://passport.everydayhero.com/api/v1/me.json?access_token=xxx

### Visibility

Restricted. Requires an authenticated user via access_token parameter.

### Parameters

access_token : _required_ **string**<br/>
User access_token provided by passport auth hash.

### Example

    https://passport.everydayhero.com/api/v1/me.json?access_token=xxxxx

### Response

<%= json :passportuser %>

## Update a new user with attributes

    PUT https://passport.everydayhero.com/api/v1/me

### Visibility

Restricted. Requires an authenticated user via access_token parameter.

### Parameters

access_token : _required_ **string**<br/>
User access_token provided by passport auth hash.

user[birthday] : _optional_ **string**<br/>
User birthday, format "YYYY-MM-DD".

user[address] : _optional_ **string**<br/>
The address passed through must be locatable through the Google Maps API. Example: "87 Wickham Terrace, Spring Hill, 4000, QLD"

### Example

    PUT https://passport.everydayhero.com/api/v1/me?access_token=xxxx&user%5Baddress%5D=someaddress&user%5Bbirthday%5D=1970-01-01

### Repsonse

    204 or 40X
