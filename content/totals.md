---
title: Totals
---
## Retrieve totals for Campaigns and Charities <small>(public)</small>

    GET https://everydayhero.com/api/v2/search/totals

### Parameters

charity_id : _optional_ **string**<br/>
Charity ID, only totals for that the specified Charity will be retrieved.

campaign_id : _optional_ **string** or **Array**<<br/>
Campaign ID, only totals for that the specified Campaign will be retrieved.
An Array of IDs can be provided, eg: campaign_id[]=au-1&campaign_id[]=au-2

page_id : _optional_ **string**br/>
Page ID, only totals for that the specified Page will be retrieved.

start_at : _optional_ **string/date-time**<br/>
Start at date, ISO format: "2014-08-20 05:02:13", filter totals by a range.

end_at : _optional_ **string/date-time**<br/>
End at date, ISO format: "2014-08-20 05:02:13", filter totals by a range.

kind : _optional_ **string**<br/>
Filter by donation type: peer_to_peer, charity, appeal, recurring, offline_donation.

country_code : _optional_ **string**<br/>
Filter by region, au, uk, us, nz.

### Response

Top level donation items include all totals.
The "types" hash includes broken down donations by type.
Each total hash includes a separate break down for gift aid totals and actual
totals.

Totals are merged regardless of currency, so if multiple regions are being
returned, it is assumed that currencies values are merged regardless of currency.

**Nested hash details**

_doc_count_  / _count_: The number of items of this particular type of donation

_avg_ : The average donation within this result set.

_sum_ : The sum of donations within this result set.

_max_ : The max donation within this result set.

_min_ : The min donation within this result set.


<%= json :totals_data %>
