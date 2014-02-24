require 'yajl/json_gem'

module EverydayHero
  module Resources
    module Helpers
      # Return a JSON representation of a resource or an array of
      # resources.
      #
      # example:
      #   json :campaign  # => {'campaign': {}}
      #   json :campaigns # => {'campaigns': [{}]}
      def json resource
        hash = case resource
        when Hash
          h = {}
          resource.each { |k, v| h[k.to_s] = v }
          h
        else Resources.const_get(constantize(resource))
        end

        %(<pre class="highlight"><code class="language-javascript">) +
          pretty_json(hash) + "</code></pre>"
      end

      private

      def constantize resource
        resource.to_s.split('_').map(&:capitalize).join
      end

      def pretty_json hash
        JSON.pretty_generate hash
      end
    end

    class Money
      ISO_CODES = {'au' => 'AUD'}
      SYMBOLS   = {'au' => '$'}
      NAMES     = {'au' => 'Australian Dollar'}

      def initialize cents, country
        @cents, @country = cents, country
      end

      def attributes
        {
          cents: @cents,
          currency: {
            iso_code: ISO_CODES.fetch(@country),
            symbol: SYMBOLS.fetch(@country),
            name: NAMES.fetch(@country)
          }
        }
      end
    end

    CampaignData = {
      id: 'au-1',
      name: 'Run Melbourne',
      slug: 'run-melbourne',
      start_at: '2013-04-01T00:00:00Z',
      finish_at: '2013-04-01T00:00:00Z',
      country_code: 'au',
      registration_url: 'http://',
      banner_url: '',
      funds_raised: Money.new('1000', 'au').attributes,
      custom_metric_total: { custom_metric:
        {
          amount: '100',
          unit: 'steps'
        }
      }
    }

    Campaign = {
      campaign: CampaignData
    }

    Campaigns = {
      campaigns: [CampaignData]
    }

    CharityData = {
      id: 'au-1',
      name: 'Starlight',
      slug: 'starlight',
      country_code: 'au',
      description: nil,
      gift_aid: false,
      logo_url: 'http://'
    }

    Charity = {
      charity: CharityData
    }

    Charities = {
      charities: [CharityData]
    }

    LeaderboardData = {
      id: 1,
      amount: Money.new('1000', 'au').attributes,
      name: 'My Leaderboard',
      pages_ids: [1, 2]
    }

    Leaderboard = {
      leaderboard: LeaderboardData
    }

    Leaderboards = {
      leaderboards: [LeaderboardData]
    }

    CampaignLeaderboardData = {
      campaign_id: 'au-1',
      page_ids: [1, 2]
    }

    CampaignLeaderboard = {
      leaderboard: CampaignLeaderboardData
    }

    PageData = {
      id: 1511,
      slug: "tim",
      gift_aid_eligible: false,
      charity_uid: "au-6",
      campaign_uid: "au-1419",
      owner_uid: 7,
      owner_type: "User",
      uid: 1511,
      state: "active",
      target_cents: 70000,
      name: "Tim",
      team_uid: nil,
      team_member_uids: [],
      team_leader_page_uid: nil,
      expires_at: "2013-08-29T14:00:00Z",
      amount: {
      cents: 0,
      currency: {
        iso_code: "AUD",
        name: "Australian Dollar",
        symbol: "$"
      }
      },
      cached_offline_amount_cents: 0,
      invitation_id: nil,
    }

    Page = {
      page: PageData
    }

    Pages = {
      pages: [PageData]
    }

    CreatedPage = {
      page: PageData.merge({campaign_date: nil}),
      meta: {
        url: "https://test-campaign-for-api.edherox.com/au/tim"
      },
    }

    TeamPageData = {
        id: 1513,
        slug: "team-tim",
        gift_aid_eligible: false,
        charity_uid: "au-6",
        campaign_uid: "au-1419",
        owner_uid: 211,
        owner_type: "Team",
        uid: 1513,
        state: "active",
        target_cents: 70000,
        name: "Team Tim",
        team_uid: nil,
        team_member_uids: [1511],
        team_leader_page_uid: 1511,
        expires_at: "2013-08-29T14:00:00Z",
        amount:  {
          cents: 0,
          currency:  {
          iso_code: "AUD",
          name: "Australian Dollar",
          symbol: "$"
        }
      },
      cached_offline_amount_cents: 0,
      invitation_id: nil
    }

    Teampage = {
      teampage: [TeamPageData]
    }

    InvitationData = {
      id: 1,
      email: 'professionalservices@everydayhero.com.au',
      accepted_at: '2013-04-01T00:00:00Z',
      cancelled_at: nil
    }

    JoinTeamInvitationData = InvitationData.merge \
      team_page_id: 1

    CreateIndividualPageInvitation = {
      create_individual_page_invitation: InvitationData
    }

    JoinTeamInvitation = {
      join_team_invitation: JoinTeamInvitationData
    }

    JoinRequestData = {
      id: 1,
      state: 'pending',
      team_page_id: 1,
      individual_page_id: 1
    }

    JoinRequest = {
      join_request: JoinRequestData
    }

    UserData = {
      uid: 1,
      name: "John O'Donnell",
      email: 'john@example.com',
      nickname: 'John',
      birthday: '1980-01-13',
      street_address: '87 Wickham Terrace',
      locality: 'Spring Hill',
      region: 'QLD',
      postal_code: '4006',
      country_name: 'Australia',
      phone: '1300798768',
      internal_id: '213',
      id: '1',
      page_ids: [1,2],
    }

    Users = {
      users: [UserData, UserData]
    }

    User = {
      user: [UserData]
    }

    Authorizedata = {
      code: "a1d74c4c1d137662fdf69615b825e4c83fa02e25"
    }

    Tokendata = {
      access_token: "xxxxxxca4e6d9d09f1d6b1330ccf97d862a7b42e87c737195f90e508d0xxxxxx",
      token_type: "bearer",
      expires_in: nil,
      refresh_token: nil,
      scope: "",
    }

    TeamData = {
      id: 1,
      uid: 1,
      name: "Team Example"
    }

    Team = {
      team: TeamData
    }

    Teams = {
      teams: [TeamData]
    }

    SearchCampaigns = {
      campaigns: [
        {
          id: 3772,
          name: "2013 Team Endurance Relay",
          country_code: "au",
          start_at: "2013-03-24T13:00:00.000Z",
          finish_at: "2015-11-28T13:00:00.000Z",
          banner_url: "campaigns/banners/original/missing.gif",
          active: true,
          charity_uids: [
            "au-48"
          ],
          _score: 1.884049,
          _type: "campaign"
        },
        {
          id: 1904,
          name: "BITE BACK: Help end malaria",
          country_code: "au",
          start_at: "2012-03-29T13:00:00.000Z",
          finish_at: "2014-06-29T14:00:00.000Z",
          banner_url: "campaigns/banners/original/missing.gif",
          active: true,
          charity_uids: [
            "au-43"
          ],
          _score: 1.3550173,
          _type: "campaign"
        }
      ]
    }

    SearchCharities = {
      charities: [
        {
          id: 2313,
          name: "Endeavour Foundation",
          slug: "endeavour-foundation",
          country_code: "au",
          description: "Endeavour Foundation is one of the largest non-government disability service provider.",
          logo_url: "charities/logos/original/missing.gif",
          url: "http://core-au.edheroy.com/charity/view?charity=48",
          active: true,
          campaign_uids: [
            "au-0",
            "au-1232"
          ],
          _score: 3.1716847,
          _type: "charity"
        },
        {
          id: 6333,
          name: "Community Plus + (West End Family Care Services Incorporated)",
          slug: "community-plus-west-end-family-care-services-incorporated",
          country_code: "au",
          description: "Community Plus provides active centres to support strong communities.",
          logo_url: "charities/logos/original/missing.gif",
          url: "http://core-au.edheroy.com/charity/view?charity=3002",
          active: true,
          campaign_uids: [
            "au-0",
            "au-4791"
          ],
          _score: 1.8563957,
          _type: "charity"
        }
      ]
    }

    SearchPages = {
      pages: [
        {
          id: 231599,
          country_code: "au",
          active: true,
          name: "Joel",
          supporter: {
            uid: 34,
            name: "Joel Richards"
          },
          campaign: {
            uid: "au-321",
            name: "Great Strides Queensland"
          },
          charity: {
            uid: "au-32",
            name: "Cystic Fibrosis Queensland"
          },
          image_url: "pages/images/original/missing.gif",
          url: "http://greatstrides-qld.edheroy.com/au/joel",
          _score: 3.2123315,
          _type: "page"
        },
        {
          id: 231781,
          country_code: "au",
          active: true,
          name: "Berry",
          supporter: {
            uid: 24,
            name: "Berrichards"
          },
          campaign: {
            uid: "au-321",
            name: "Great Strides Queensland"
          },
          charity: {
            uid: "au-21",
            name: "Cystic Fibrosis Queensland"
          },
          image_url: "pages/images/original/missing.gif",
          url: "http://greatstrides-qld.edheroy.com/au/berry",
          _score: 0.2123315,
          _type: "page"
        }
      ]
    }
  end
end

include EverydayHero::Resources::Helpers
