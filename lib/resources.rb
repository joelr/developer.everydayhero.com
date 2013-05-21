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
      funds_raised: Money.new('1000', 'au').attributes
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
    }

    Page = {
      page: PageData
    }

    Pages = {
      pages: [PageData]
    }

    InvitationData = {
      id: 1,
      email: 'support@everydayhero.com',
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
      nickname: 'John',
      email: 'john@example.com',
      phone: '1300798768',
      birthday: '1980-01-13',
      street_address: '87 Wickham Terrace',
      extended_address: nil,
      locality: 'Spring Hill',
      region: 'QLD',
      postal_code: '4006',
      country_name: 'Australia',
      page_ids: [1,2],
    }

    Users = {
      users: [UserData]
    }
  end
end

include EverydayHero::Resources::Helpers
