---
title: Metadata
---

* TOC
{:toc}

The metadata service allows keys to be specified for object types, and values to
be specified for specific objects of that type.

There is no traditional authentication required for this service, instead we
scope the data under the token you provide.

## List all Keys

    GET https://mds.everydayhero.io/api/v1/keys

### Parameters

type : _required_ **string**<br />
The object type (Page, Campaign, etc).

token : _required_ **string**<br />
Scope for the data required.

### Example

    https://mds.everydayhero.io/api/v1/keys?type=Page&token=30e466c3-ffae-413a-a5cc-59563d16605d

### Response

<%= json :keys %>

## Create a key

    POST https://mds.everydayhero.io/api/v1/keys

### Parameters

token : _required_ **string**<br/>
Scope for the data specified.

key : _required_ **string**<br/>
The key you would like to add for this type.

type : _required_ **string**<br/>
The object type (Page, Campaign, etc).

description : _required_ **string**<br/>
Describe what values for this key should represent.

### Example

<%= json \
  token: "30e466c3-ffae-413a-a5cc-59563d16605d",
  key: "constituent_id",
  type: "Page",
  description: "foo bar"
%>

### Response

`204 No Content` for Success

`404 Not Found` for Invalid Key

## Update a key

    PUT https://mds.everydayhero.io/api/v1/keys/:id

### Parameters

token : _required_ **string**<br/>
Scope for the data specified.

id : _required_ **integer**<br/>
ID of the key you would like to update.

key : _required_ **string**<br/>
The new key name.

description : _required_ **string**<br/>
The new key description.

### Example

<%= json \
  token: "30e466c3-ffae-413a-a5cc-59563d16605d",
  id: "30",
  key: "constituent_id",
  description: "foo bar"
%>

### Response

`204 No Content` for Success

`404 Not Found` for Invalid Key

## Destroy a key

    DELETE https://mds.everydayhero.io/api/v1/keys/:id

### Parameters

token : _required_ **string**<br/>
Scope for the data specified.

id : _required_ **integer**<br/>
ID of the key to destroy.

### Example

    https://mds.everydayhero.io/api/v1/keys/30?token=30e466c3-ffae-413a-a5cc-59563d16605d

### Response

`204 No Content` for Success

`403 Forbidden` for Invalid Token

## Show stats for a key

    GET http://mds.everydayhero.io/api/v1/keys/:id/stats

### Parameters

token : _required_ **string**<br/>
Scope for the data required.

id : _required_ **integer**<br/>
ID of the key you would like stats for.

### Example

    http://mds.everydayhero.io/api/v1/keys/30/stats?token=30e466c3-ffae-413a-a5cc-59563d16605d

### Response

<%= json :key_stats %>

## List all metadata

    GET https://mds.everydayhero.io/api/v1/metadata

### Parameters

token : _required_ **string**<br/>
Scope for the data required.

type : _required_ **string**<br/>
The object type (Page, Campaign, etc).

ids : _required_ **string**<br/>
IDs of the objects of the specified type you would like metadata for.

### Example

    https://mds.everydayhero.io/api/v1/metadata?token=30e466c3-ffae-413a-a5cc-59563d16605d&type=Page&ids=1,2,3,5,8

### Response

<%= json :meta_data %>

## Create metadata

    POST https://mds.everydayhero.io/api/v1/metadata

### Parameters

token : _required_ **string**<br/>
Scope for the data specified.

type : _required_ **string**<br/>
The object type (Page, Campaign, etc).

id : _required_ **integer**<br/>
ID of the object of this type you would like to set a value for.

key : _required_ **string**<br/>
The key you would like to set a value for.

value : _required_ **string**<br/>
The value for this key.

### Example

<%= json \
  token: "30e466c3-ffae-413a-a5cc-59563d16605d",
  type: "Page",
  id: "1",
  key: "constituent_id",
  value: "foo"
%>

### Response

`204 No Content` for Success

`404 Not Found` for Invalid Key
