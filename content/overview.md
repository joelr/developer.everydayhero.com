---
title: Overview
---

* TOC
{:toc}

## Schema

All API access is over HTTPS, and accessed from the everydayhero.com/api/v1 domain. All data is sent and received as JSON.

    $ curl -i https://everydayhero.com/api/v1/leaderboards

    HTTP/1.1 200 OK
    Etag: "953c3675962fbabd0bc23fc2072ac018"
    Last-Modified: Sat, 05 Jan 2013 07:17:33 GMT
    Content-Type: application/json; charset=utf-8
    Cache-Control: max-age=0, private, must-revalidate
    X-Ua-Compatible: IE=Edge
    X-Request-Id: 8ceea1bf56032cadf9a91c4365450e0e
    X-Runtime: 0.056746
    Content-Length: 19
    Server: WEBrick/1.3.1 (Ruby/1.9.3/2012-04-20)
    Date: Sat, 05 Jan 2013 11:40:26 GMT
    Connection: Keep-Alive

    {"leaderboards":[]}

Blank fields are included as null instead of being omitted.

All timestamps are returned in ISO 8601 format:

    YYYY-MM-DDTHH:MM:SSZ

## Parameters

Many API methods take optional parameters. For GET requests, any
parameters not specified as a segment in the path can be passed as an
HTTP query string parameter:

    $ curl -i https://everydayhero.com/api/v1/leaderboards?ids=123

In this example the `:ids` parameter is passed in query string.

For POST requests, parameters not included in the URL should be encoded
as JSON with a Content-Type of ‘application/x-www-form-urlencoded’:

    $ curl -i -H "Authorization: Token token=your-token" -d '{}' \
        https://everydayhero.com/api/v1

## Auth Errors

There are two possible auth errors supported by the API:

1. Requesting resources that require authentication will result in a
`401 Unauthorized` response.

    HTTP/1.1 401 Unauthorized
    Date: Sun, 20 Jan 2013 21:58:06 GMT
    Status: 401 Unauthorized
    Strict-Transport-Security: max-age=31536000
    Content-Type: application/json; charset=utf-8
    X-UA-Compatible: IE=Edge,chrome=1
    Cache-Control: no-cache
    X-Request-Id: a024f7bfdcd8174551b46f8a15cfdac5
    X-Runtime: 0.007114
    X-Rack-Cache: miss
    Transfer-Encoding: chunked

    "error": {
      "message": "You need to authenticate for this resource"
    }

2. Requesting resources that you do not have permission to request will
result in a `403 Forbidden` response.

    HTTP/1.1 403 Forbidden
    Date: Sun, 20 Jan 2013 21:58:08 GMT
    Status: 403 Forbidden
    Strict-Transport-Security: max-age=31536000
    Content-Type: application/json; charset=utf-8
    X-UA-Compatible: IE=Edge,chrome=1
    Cache-Control: no-cache
    X-Request-Id: a024f7bfdcd8174551b46f8a15cfdac5
    X-Runtime: 0.007114
    X-Rack-Cache: miss
    Transfer-Encoding: chunked

    "error": {
      "message": "You are not authorized to view this resource"
    }

## Validation Errors

All validation errors resulting from a POST or PUT request will contain
a message and an array of errors. For more information on fixing the
validation errors see the corresponding documentation for the request.

    "error": {
       "message": "Validation failed",
       "errors": [
         {
           "field": "uid",
           "code": "invalid"
         }
       ]
     }

## HTTP Verbs

Where possible, the API uses the appropriate HTTP verbs

GET
: Used for retrieving resources

POST
: Used when creating resources

PUT
: Used when updating resources

DELETE
: Used when deleting resources

## Authentication

There is only one authentication scheme in place for the API: Token Authentication. Requests that require authentication will return a status of 401.

    $ curl -i -H "Authorization: Token token=your-token" https://everydayhero.com/api/v1

## Glossary

Individual Page
: A Supporter Page that is not participating in a team and is not a
team page.
