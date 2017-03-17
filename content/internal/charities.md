---
title: Charities
body_id: internal_overview
---

Charities can be updated via the internal API

<p class='info'><strong>Authentication types</strong>: OAuth (Internal) Application Token</p>


## Example request to hide from search

    PATCH /api/v2/internal/charities/CHARITY_UID_OR_UUID
    Authorization: Bearer APP_BEARER_TOKEN
    Content-Type: application/json

    {"charity":{"hidden":true}}

Example curl request

    curl -X PATCH -H "Authorization: Bearer BEARER_TOKEN" -H "Content-Type: application/json" -d '{"charity":{"hidden":true}}' "https://everydayhero-staging.com/api/v2/internal/charities/CHARITY_UID_OR_UUID"
