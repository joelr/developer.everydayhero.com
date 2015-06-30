---
title: Users
---

* TOC
{:toc}

## Get current user

<p class='info'><strong>Authentication types</strong>: OAuth User Token</p>

    GET https://passport.everydayhero.com/api/v1/me

### Parameters

access_token : _required_ **string**<br/>
User access_token provided by passport auth hash.

### Example

    https://passport.everydayhero.com/api/v1/me.json?access_token=xxxxx

### Response

<%= json :user %>

## Update a new user with attributes

<p class='info'><strong>Authentication types</strong>: OAuth User Token</p>

    PUT https://passport.everydayhero.com/api/v1/me

### Parameters

access_token : _required_ **string**<br/>
User access_token provided by passport auth hash.

#### User address

The user address should be sent as a hash of attributes, although a single string is also supported.


user[address][street_address] : _optional_ **string**<br/>
user[address][extended_address] : _optional_ **string**<br/>
user[address][locality] : _optional_ **string**<br/>
user[address][region] : _optional_ **string**<br/>
user[address][postal_code] : _optional_ **string**<br/>
user[address][country_name] : _optional_ **string**<br/>
user[address][latitude] : _optional_ **string**<br/>
user[address][longitude] : _optional_ **string**<br/>

_or_

user[address] : _optional_ **string**<br/>
The address passed through must be locatable through the Google Maps API. Example: "87 Wickham Terrace, Spring Hill, 4000, QLD"

user[birthday] : _optional_ **string**<br/>
User birthday, format "YYYY-MM-DD".

user[phone] : _optional_ **string**<br/>
User phone number

### Example

    PUT https://passport.everydayhero.com/api/v1/me?access_token=xxxx&user%5Baddress%5D=87+Wickham+Terrace,Spring+Hill,4000,QLD&user%5Bbirthday%5D=1970-01-01

### Repsonse

`204` or `40X`
