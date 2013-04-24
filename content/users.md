---
title: Users
---

* TOC
{:toc}

## List all Users

    GET /users

### Visibility

Public.

### Parameters

search : _Optional_ **string**. Retrieve only the users with either a name, nickname or email matching the provided keyword(s).

### Repsonse

<%= json :users %>
