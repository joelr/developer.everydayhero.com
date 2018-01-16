---
title: Search
---

* TOC
{:toc}

The search api enables efficient text search on entities (backed by Elastic Search) and is suitable for applications such as auto-completion. Currently, the search api endpoints returns the top 100 related results and ordered based on their similarity ranking scores (each of the result entities is also associated with a `_score` value indicating the relevence to the query specified). Additionally, in order to provide capability to support mixed entity search, each of the entities in the results is also associated with a `_type` field indicating the entity type (i.e. `page`, `charity` or `campaign`).

Please note, all of the search API endpoints accepts three types of parameters, specifically:

* a set of *filter* parameters (e.g. `country_code`, `campaign_ids`, `charity_ids`, `cause_ids`). The filter parameters decide if a entity should be included in the result set or not. For example, if `country_code=au`, the result will **only** contain entities with `country_code=au`. Moreover, some of the filter parameters support mutiple filter values, and the filter values should be specified as a comma separated string. For example, `charity_ids=1,2` can be used to search entities belonging to either charity 1 and 2.

* a single *text search* parameter (i.e. `q`). The text search parameter matches one or more text fields on the designated entity, and based on the relevence between the text fields and the query, a ranking score (i.e. `_score`) will be computed, and the results will be sorted based on the scores. If the text parameter is not provided or not matching anything, the endpoints will still return 100 entities conforming to the filter parameters if specifed.

* a set of *result size limit* parameters (i.e. `limit`, `page` and `page_size`). The result size limit parameters enable better search performance by limiting the number of results being returned at a single request. There are two ways currently supported for limiting the result sizes, one is with the pagination (through `page` and `page_size`) and another is without (`limit`). Users can enable pagination by specifiy the `page` parameter (page starts at 1) in the request (with `page_size` set to 100 by default), and the page size can be adjusted by the `page_size` parameter. For example, setting `page=2&page_size=20` will return the second page of results set, and the first item in the page is the 21st item in the entire result set. On the other hand, to limit the result size without pagination, one can utlize the `limit` parameter to force the search only returns the top few result items.

## Consistent pagination/ordering

For bulk imports of data, or iterating through results sets you may wish to use consistent ordering. This effectively provides a snapshot in time of the requested data, and allows iteration through the results set within a window time.

Campaigns, Charities, and Pages endpoints support this feature.

It can be accessed by adding a param of `scroll=true` to the first query (along with other required query params). Results are provided in 5000 record batches. The results can be iterated by appending the `scroll_id` attribute from the meta hash to the following query. The param `scroll=true` should only be used for the first request, and subsequent requests to iterate through results set should use the `scroll_id` param, which changes for each request.


#### Example

    GET https://everydayhero.com/api/v2/search/campaigns?scroll=true

Response (partial for brevity):

    {"charities": [...], meta: {scroll_id: "c2NhMjY5Ow==", ...}}

Subsequent request:

    GET https://everydayhero.com/api/v2/search/campaigns?scroll_id=c2NhMjY5Ow==

Subsequent requests should use the `scroll_id` from the previous request. Other pagination and query params are ignored if a `scroll_id` is present.

## Campaigns

    GET https://everydayhero.com/api/v2/search/campaigns

### Parameters

country_code : _optional_ **string**<br/>
Only retrieve campaigns for the country code specified. For example `au`
will retrieve campaigns with country code `au` (i.e. Australia).

charity_ids : _optional_ **string**<br/>
Only retrieve campaigns for the charity ids specified (in the comma separated form). For example `au-1,au-2` will retrieve campaigns with charity ids `au-1` and `au-2`.

q : _optional_ **string**<br/>
Retrieve campaigns with `campaign name` match or partially match to the specified search string.

### Example

    https://everydayhero.com/api/v2/search/campaigns?country_code=au&q=end

### Response

<%= json :search_campaigns %>

## Charities

    GET https://everydayhero.com/api/v2/search/charities

### Parameters

campaign_id : _optional_ **string**<br/>
Only retrieve charities participating in the campaign specified. For example `gb-1`
will retrieve charities for campaign id `gb-1`.

country_code : _optional_ **string**<br/>
Only retrieve charities for the country code specified. For example `au`
will retrieve charities with country code `au` (i.e. Australia).

cause_ids : _optional_ **string**<br/>
Only retrieve charities for the cause ids specified (in the comma separated form). For example `1,2,3` will retrieve charities with cause ids 1, 2 and 3.

tax_number: _optional_ **string**<br/>
Only retrieve charities for tax number specified. For example `13423123` will retrieve charities with tax number (or ein) `13423123`.

include_failed_kyc : _optional_ **boolean** (true or false)<br/>
By default (when this parameter is not specified), the search will only return charities that passes KYC. When `include_failed_kyc=true`, the search will return all charities including these KYC failed ones.

q : _optional_ **string**<br/>
Retrieve charities with `charity name` match or partially match to the specified search string.

### Example

    https://everydayhero.com/api/v2/search/charities?country_code=au&campaign_id=au-0&q=end

### Response

<%= json :search_charities %>

## Pages

    GET https://everydayhero.com/api/v2/search/pages

### Parameters

charity_id : _optional_ **string**<br/>
Only retrieve pages participating in the charity specified. For example `au-1`
will retrieve pages which support charity id `au-1`.

charity_uuid : _optional_ **string**<br/>
Only retrieve pages participating in the charity specified. For example `4d8a65ae-b0fe-481e-9fe7-02dee71b285d`
will retrieve pages which support charity uuid `4d8a65ae-b0fe-481e-9fe7-02dee71b285d`.

campaign_id : _optional_ **string**<br/>
Only retrieve pages participating in the campaign specified. For example `gb-1`
will retrieve pages which support campaign id `gb-1`.

campaign_uuid : _optional_ **string**<br/>
Only retrieve pages participating in the campaign specified. For example `dcaa7c04-8fb1-4ba3-8376-6eb89db057cd`
will retrieve pages which support campaign uuid `dcaa7c04-8fb1-4ba3-8376-6eb89db057cd`.

country_code : _optional_ **string**<br/>
Only retrieve pages participating in the country code specified. For example `au`
will retrieve pages with country code `au` (i.e. Australia).

type : _optional_ **string**<br />
Only retrieve pages that match the specified type. For example `team` will retrieve only team pages. Supported values include `all`, `user` and `team`. Defaults to `all`.

group_value : _optional_ **String/Array**<br/>
Return pages matching specific page group value, or any of the provided array values.

active : _optional_  **string**<br />
Only retrieve pages based on whether they are active or not. Valid values are `true`, `false`, or `all`.  Default is `true`, meaning only active pages are returned by default.

expires_after : _optional_ **date-time**<br />
Only retrieve pages that expire after the given date.  Values are in iso8601 date time format.  For example, `2015-01-01` would show pages that expire after January 1, 2015.  The default is the current data and time.

### Example

    https://everydayhero.com/api/v2/search/pages?country_code=au&campaign_id=au-321&q=richards&group_value[]=QLD

### Response

<%= json :search_pages %>
