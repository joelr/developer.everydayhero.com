---
title: Search
---

* TOC
{:toc}

The search api enables efficient text search on entities (backed by Elastic Search) and is suitable for applications such as auto-completion. Currently, the search api endpoints returns the top 100 related results and ordered based on their similarity ranking scores (each of the result entities is also associated with a `_score` value indicating the relevence to the query specified). Additionally, in order to provide capability to support mixed entity search, each of the entities in the results is also associated with a `_type` field indicating the entity type (i.e. `page`, `charity` or `campaign`).

Please note, all of the search api endpoints accepts two types of parameters, specifically:

* a set of *filter* parameters (e.g. `country_code`, `campaign_id`, `charity_id`). The filter parameters decide if a entity should be included in the result set or not. For example, if `country_code=au`, the result will **only** contain entities with `country_code=au`.

* a single *text search* parameter (i.e. `q`). The text search parameter matches one or more text fields on the designated entity, and based on the relevence between the text fields and the query, a ranking score (i.e. `_score`) will be computed, and the results will be sorted based on the scores. If the text parameter is not provided or not matching anything, the endpoints will still return 100 entities conforming to the filter parameters if specifed.


## Campaigns

    GET https://supporter.dev/api/v2/search/campaigns

### Parameters

country_code : _optional_ **string**<br/>
Only retrieve campaigns for the country code specified. For example `au`
will retrieve campaigns with country code `au` (i.e. Australia).

q : _optional_ **string**<br/>
Retrieve campaigns with `campaign name` match or partially match to the specified search string.

### Example

    https://supporter.dev/api/v2/search/campaigns?country_code=au&q=end

### Response

<%= json :search_campaigns %>

## Charities

    GET https://supporter.dev/api/v2/search/charities

### Parameters

campaign_id : _optional_ **string**<br/>
Only retrieve charities participating in the campaign specified. For example `gb-1`
will retrieve charities for campaign id `gb-1`.

country_code : _optional_ **string**<br/>
Only retrieve charities for the country code specified. For example `au`
will retrieve charities with country code `au` (i.e. Australia).

q : _optional_ **string**<br/>
Retrieve charities with `charity name` match or partially match to the specified search string.

### Example

    https://supporter.dev/api/v2/search/charities?country_code=au&campaign_id=au-0&q=end

### Response

<%= json :search_charities %>

## Pages

    GET https://supporter.dev/api/v2/search/pages

### Parameters

charity_id : _optional_ **string**<br/>
Only retrieve pages participating in the charity specified. For example `au-1`
will retrieve pages which support charity id `au-1`.

campaign_id : _optional_ **string**<br/>
Only retrieve pages participating in the campaign specified. For example `gb-1`
will retrieve pages which support campaign id `gb-1`.

country_code : _optional_ **string**<br/>
Only retrieve pages participating in the country code specified. For example `au`
will retrieve pages with country code `au` (i.e. Australia).

q : _optional_ **string**<br/>
Retrieve pages with `page name` or `supporter name` match or partially match to the specified search string.

### Example

    https://supporter.dev/api/v2/search/pages?country_code=au&campaign_id=au-321&q=richards

### Response

<%= json :search_pages %>

