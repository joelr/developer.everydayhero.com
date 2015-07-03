---
title: Rate limits
body_id: page_overview
---

Some API endpoints are rate limited, the current endpoints with this enabled are:

 - [/v2/pages](/pages/#list-all-pages-smallpublicsmall)
 - [/v2/campaigns](/campaigns/)
 - [/v2/charities](/charities/)

If you hit rate limits you will be served with a JSON error message long with [429 status code](http://tools.ietf.org/html/rfc6585#section-4). Requests made that give a 429 response do not contribute to the rate limiting count.

The current rate limits are a rolling 180 second period, with 25 seconds per request within a period, however this may change in the future. It is best to implement a solution that can handle and retry requests when rate limits are hit.