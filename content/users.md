---
title: Users
---

* TOC
{:toc}

## List all Users

    GET https://passport.everydayhero.com/api/v1/users

### Visibility

Restricted. Requires an authenticated user via access_token param.

### Parameters

search : _Optional_ **string**. Retrieve only the users with either a name, nickname or email matching the provided keyword(s).

### Repsonse

<%= json :users %>

## Get current user

    GET https://passport.everydayhero.com/api/v1/me.json?access_token=xxx

### Visibility

Restricted. Requires an authenticated user via access_token param.

### Parameters

access_token : _Required_ **string** User access_token provided by passport auth hash

### Example request

    https://passport.everydayhero.com/api/v1/me.json?access_token=dc2e3c7c72a297e9df6ffdb60a98e4c841ca384dfeca890b2db9800e830xxxxx

### Response

<%= json :passportuser %>

## Update a new user with attributes

    PUT https://passport.everydayhero.com/api/v1/me

### Visibility

Restricted. Requires an authenticated user via access_token param.

### Parameters

access_token : _Required_ **string** User access_token provided by passport auth hash

user[birthday] : _optional_ **string** User birthday, format "YYYY-MM-DD".

user[address] : _optional_ **string** Full user address, example: "87 Wickham Terrace, Spring Hill, 4055, QLD"

### Example request

    PUT https://passport.everydayhero.com/api/v1/me?access_token=abc&user%5Baddress%5D=someaddress&user%5Bbirthday%5D=1970-01-01

### Repsonse

    204 or 40X
