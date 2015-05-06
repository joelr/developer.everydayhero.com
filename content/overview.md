---
title: Overview
body_id: page_overview
---
## Environments

We have two environments available for use: sandbox and production. Sandbox should be used when initiating any integration work with the everydayhero API. Once development and appropriate QA has been completed we will provide you with production credentials.

Sandbox: [https://edheroz.com](https://edheroz.com)

Production: [https://everydayhero.com](https://everydayhero.com)

## Schema

All API access is over HTTPS, and accessed from the everydayhero.com/api/v2 domain. All data is sent and received as JSON. A suffix of .json is required for GET requests. .jsonp suffix can be used for cross domain requests, with a require callback
parameter.

    $ curl -i https://everydayhero.com/api/v2/leaderboards

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

    YYYY-MM-DDThh:mm:ssZ

## Parameters

Many API methods take optional parameters. For GET requests, any
parameters not specified as a segment in the path can be passed as an
HTTP query string parameter:

    $ curl -i https://everydayhero.com/api/v2/leaderboards?ids=123

In this example the `ids` parameter is passed in the query string.

For POST requests, parameters not included in the URL should be encoded
as JSON with a Content-Type of ‘application/x-www-form-urlencoded’:

    $ curl -i -H "Authorization: Token token=your-token" -d '{}' https://everydayhero.com/api/v2

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

There are three methods of authentication for the API:

  -  RegisteredApplication, for API calls not via OAuth
  -  OAuthClient, for API calls directly from your OAuth Application
  -  OAuthUser, for API calls on behalf of users



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

## OAuth Client Authentication

To fetch your Client API token, it requires doing the following request:

    POST /oauth/token?grant_type=client_credentials&client_id=x&client_secret=x

This will return JSON containing your OAuth Client token.

## OAuth User Authentication

After a user connection flow via OAuth, a token will be provided that will be
usuable on OAuth user scoped API calls.

## Pagination

Every endpoint which returns data has the option to return that data in a paged
format. Pagination allows a subset of the data to be returned instead of the entire
dataset.

Endpoints are optionally paginated, however if the resource attempts to retrieve
more than 1000 objects, and error will be returned. This can be resolved by
using pagination for all requests.

    {
      "error": {
        "status": "unprocessable_entity",
        "message": "Response too large, please paginate"
      }
    }

### Parameters

limit : _optional_ **integer**<br/>
The number of items per page.

page : _optional_ **integer**<br/>
The page number to return.

### Example

    https://everydayhero.com/api/v2/pages.json?limit=10&page=1

### Response

    {
      "pages":[ ... ],
      "meta":{
        "count":138718,
        "current_page":1,
        "total_pages":139,
        "first_page":true,
        "last_page":false
      }
    }

## Caching

GET requests for Pages, Campaigns, Charities and Campaign Leaderboards are cached for 10minutes. The cache is a rolling 10 minute period which is unique for each endpoint. Data for these responses will be no older than 10 minutes.