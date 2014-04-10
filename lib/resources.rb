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

    FitnessActivityOverview = {
      run: {
        duration_in_seconds: 20165,
        calories: 6575,
        distance_in_meters: 69141
      }
    }

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
      fitness_activity_overview: FitnessActivityOverview,
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

    CharityDataAU27 = {
      name: 'Starlight Children\'s Foundation',
      id: 'au-27',
      slug: 'starlight-children-s-foundation',
      country_code: 'au',
      description: 'The Starlight Children’s Foundation transforms the experience of hospitalisation and treatment for seriously ill children and their families- Starlight is the only children’s charity with a permanent, physical presence in very major paediatric hospital in the country. \r\n\r\nEvery minute of every day a child is admitted to hospital in Australia. For thousands of these children what happens next is the diagnosis of a serious or chronic illness that changes their life, and the lives of their families, forever. \r\n\r\nThis is where Starlight steps in - delivering a range of innovative programs, built on the World Health Organisation’s social model of health, to support the well-being and resilience of these seriously ill children and their families.\r\n\r\nStarlight programs are integral to the total care of seriously ill children - while the health professionals focus on treating the illness, Starlight is there to lift the spirits of the child - giving them the opportunity to laugh and play and be a child again.\r\n\r\nFor more information on Starlight, visit www.starlight.org.au or call 1300 727 827.',
      gift_aid: false,
      logo_url: 'https://deplyv9vomqtj.cloudfront.net/charities/logos/au-27/original/SCF_Logo_RGB_horizontal-a499cd320b54c5b9a52dd03ffc0260d0.jpg',
      url: 'http://everydayhero.com.au/charity/view?charity=27'
    }

    CharityDataAU169 = {
      name: 'Youngcare',
      id: 'au-169',
      slug: 'youngcare',
      country_code: 'au',
      description: 'YOU CAN BE PART OF THE SOLUTION\r\n\r\nRight now, 7,500 young Australians are living in aged care, simply because there are few alternatives.\r\n\r\nWith YOUR support we can drive change and keep young people out of aged care, because aged care is NO place for any young person.\r\n\r\nTo find out more about Youngcare and what we do, visit www.youngcare.com.au',
      gift_aid: false,
      logo_url: 'https://deplyv9vomqtj.cloudfront.net/charities/logos/au-169/original/youngcare-ebd010dfd2c0189c267a22cb3403640f.gif',
      url: 'http://everydayhero.com.au/charity/view?charity=169'
    }

    CharityIndex = {
      charities: [CharityDataAU27, CharityDataAU169]
    }

    CharityShow = {
      charity: CharityDataAU27
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
      fitness_activity_overview: FitnessActivityOverview,
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
      fitness_activity_overview: FitnessActivityOverview,
      invitation_id: nil
    }

    Teampage = {
      teampage: [TeamPageData]
    }

    InvitationData = {
      id: 1,
      email: 'professionalservices@everydayhero.com.au',
      accepted_at: nil,
      cancelled_at: nil
    }

    JoinTeamInvitationData = InvitationData.merge({
      team_page_id: 1,
      token: 'xxxxxxxxx'
    })

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
          kyc_status: "passed",
          claimed: true,
          tax_number: '12443251',
          street_address: nil,
          locality: nil,
          region: nil,
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
          kyc_status: "passed",
          claimed: true,
          tax_number: '123144294',
          street_address: nil,
          locality: nil,
          region: nil,
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
        },
      ]
    }

    SearchVolunteeringOpportunities = {
      volunteering_opportunities: [
        {
          id: 980782,
          name: "Assist Rhode Island!",
          description: "Goodwill of Rhode Island is seeking volunteers.",
          organization_name: "Goodwill Industries of Rhode Island, Inc.",
          coordinate: {
            lat: 41.82399,
            lon: -71.41283
          },
          address: "Providence, RI, US",
          url: "http://www.volunteermatch.org/results/opp_detail.jsp?oppid=980782&apiAccountName=everydayhero&isPublicProgramKey=true",
          image_url: nil,
          virtual: false,
          created: nil,
          ongoing: true,
          start_date: nil,
          end_date: nil,
          country_code: "US",
          active: true,
          great_for: [ ],
          skills_needed: nil,
          minimum_age: nil,
          spaces_available: nil,
          causes: [
            {
              id: 3,
              key: "education"
            },
            {
              id: 31,
              key: "human_services"
            }
          ],
          _score: 1,
          _type: "opportunity",
          _sort: nil
        },
      ]
    }
  end
end

include EverydayHero::Resources::Helpers
