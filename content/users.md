---
title: Users
---

* TOC
{:toc}

## Get current user <small>(requires authentication)</small>

    GET https://passport.everydayhero.com/api/v1/me

### Parameters

#### Query String

access_token : _required_ **string**<br/>
User access_token provided by passport auth hash.

### Example

    https://passport.everydayhero.com/api/v1/me.json?access_token=xxxxx

### Response

<%= json :user %>

## Update a new user with attributes <small>(requires authentication)</small>

    PUT https://passport.everydayhero.com/api/v1/me

### Parameters

#### PUT

access_token : _required_ **string**<br/>
User access_token provided by passport auth hash.

user[birthday] : _optional_ **string**<br/>
User birthday, format "YYYY-MM-DD".

user[address] : _optional_ **string**<br/>
The address passed through must be locatable through the Google Maps API. Example: "87 Wickham Terrace, Spring Hill, 4000, QLD"

### Example

    PUT https://passport.everydayhero.com/api/v1/me?access_token=xxxx&user%5Baddress%5D=87+Wickham+Terrace,Spring+Hill,4000,QLD&user%5Bbirthday%5D=1970-01-01

### Repsonse

`204` or `40X`
