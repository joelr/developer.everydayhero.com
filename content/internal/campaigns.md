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

### Other campaign options
``disable_tracker_activities``
Disables daily fitbit activities within a campaign. Manual and individual activities from fitbit will sync, but daily tracked activities will not sync.

``donation_trigger_thresholds``
Donation raised thresholds in cents/pence. Defaults to: [2500, 5000, 10000, 20000, 50000, 100000, 250000, 500000]. Triggers will be sent at the specified threshold for behavioral emails.

``fitness_total_options``
See examples above, supported params available at [Fitness leaderboard](/search-fitness-activities/).

``hidden``
Removes campaign from search (eg, get-started campaign suggestions).

``opgs_fitness_goal``
Enable fitness goals to be entered on One Page Get-Started

``preferred_fitness_unit``
See example above, mi, km are supported.

``skip_page_create_notification``
Skips emailing the user after page creation.
