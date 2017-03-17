---
title: Campaigns
body_id: internal_overview
---

Campaigns can be updated via the internal API

<p class='info'><strong>Authentication types</strong>: OAuth (Internal) Application Token</p>


## Example request to hide from search

    PATCH /api/v2/internal/campaigns/CAMPAIGN_UID_OR_UUID
    Authorization: Bearer APP_BEARER_TOKEN
    Content-Type: application/json

    {"campaign":{"hidden":true}}

Example curl request

    curl -X PATCH -H "Authorization: Bearer BEARER_TOKEN" -H "Content-Type: application/json" -d '{"campaign":{"hidden":true}}' "https://everydayhero-staging.com/api/v2/internal/campaigns/CAMPAIGN_UID_OR_UUID"

## Other example payloads:

Setting preferred fitness unit (for sidebar totals):
(mi or km supported)

    {"campaign":{"preferred_fitness_unit":"mi"}}

Defining custom totals filters:
Supported params available at [Fitness leaderboard](/search-fitness-activities/)

    {"campaign":{"fitness_total_options":{"start_at":"2016-01-01","end_at":"2019-01-01"}}}
