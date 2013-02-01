---
title: Leaderboards
---

* TOC
{:toc}

The Leaderboards API allows you to retrieve leaderboards and their
assocated pages.

## List all Leaderboards

    GET /leaderboards

### Visibility

Public.

### Parameters

ids
: _Optional_ **string** - `1,5,20` to only retrieve leaderboards with
the ids 1, 5 and 20

### Response

<%= json :leaderboards %>

## View a single Leaderboard

    GET /leaderboards/:id

### Visibility

Public.

### Response

<%= json :leaderboard %>
