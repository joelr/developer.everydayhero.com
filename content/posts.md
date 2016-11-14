---
title: Page Posts
---

Posts appear on a user's activity feed. This API endpoint should only be used for user-driven content posts.

## Create Post

<p class='info'><strong>Authentication types</strong>: OAuth User Token only</p>

    POST https://everydayhero.com/api/v2/posts

### Parameters

page_id : _required_ **integer**<br/>
The page to create a post on. This page ID must be owned by the authenticated user.

caption : _required_ **string**<br/>
Post content, markdown accepted.

image_url : _optional_ **string**<br/>
Optional URL for image to be associated with a post.

created_at : _optional_ **date/time**<br/>
Optional timestamp for post, ISO8601 format.

### Example

    curl -H "Authorization: Bearer XXX" \
    -d "{\"page_id\":\"123\",\"caption\":\"This is a test post\",\"image_url\":\"http://example.com/image.jpg\",\"created_at\":\"2015-01-01 09:00:00\"}" \
    https://everydayhero.com/api/v2/posts.json

### Response

201 CREATED

<%= json \
  post: {
    id: 456,
    caption: "This is a test post",
    page_id: 123,
    image_url: "http://example-cdn.com/processed/image.jpg"
  }
%>

or 

422 Unprocessable Entity

<%= json \
  error: {
    message: "Validation failed",
    error: [{field: "type", code:"invalid"}]
  }
%>
