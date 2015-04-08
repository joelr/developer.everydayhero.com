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

    TotalData = {
      count: 10,
      min: 100,
      max: 200,
      avg: 150,
      sum: 1230
    }

    GroupedTotalData = {
      total_amount_cents: TotalData,
      total_gift_aid_amount_cents: TotalData
    }

    NestedDonationTotal = GroupedTotalData.merge({
      doc_count: 124
    })

    TotalsData = GroupedTotalData.merge({
      types: {
        peer_to_peer: NestedDonationTotal,
        charity: NestedDonationTotal,
        appeal: NestedDonationTotal,
        recurring: NestedDonationTotal,
        offline_donation: NestedDonationTotal
      }
    })

    CampaignData = {
      id: 'au-1',
      name: 'Run Melbourne',
      status: 'active',
      slug: 'run-melbourne',
      start_at: '2013-04-01T00:00:00Z',
      finish_at: '2013-04-01T00:00:00Z',
      country_code: 'au',
      registration_url: 'http://',
      banner_url: '',
      charity_ids: [123, 456],
      charity_uids: ['au-654', 'au-334'],
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
      created_at: "2013-08-29T14:00:00Z",
      updated_at: "2013-08-29T14:00:00Z",
      url: "https://give.everydayhero.com/au/sample",
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
      coordinate: {
        lat: -32.88,
        lon: 138.34
      },
      story: "Hi Everyone, <BR><BR>\r\nMy name is Budha and I am here to; raise awareness, a substantial amount of funds and to continuously remind you of the ongoing issues of youth homelessness, specifically a program known as 'Frontyard Youth Services' inside the Melbourne CBD. \r\n<BR>\r\n\"Frontyard seeks to provide young people with choices that contribute to their health and wellbeing, and where possible, return them to their community of origin.\"\r\n<BR>\r\nBeing in this age bracket as well as living in Melbourne, I feel as if i can make a difference and so can you!\r\n<BR>\r\nMy short-term goal is to raise at least $100,000 by this time next year! My long-term goal is to continue raising awareness and to support Melbourne based programs that affect our youth.\r\n<BR>\r\nWould appreciate as much love as I can get and stay tuned for the 2 major events that \"100% Entertainment\" will be hosting throughout the year!\r\n<BR>\r\nhttp://www.facebook.com/1Hundred.Percent.Entertainment\r\n<BR>\r\nThankyou",
      image: {
        original_image_url: "https://deplyv9vomqtj.cloudfront.net/pages/images/26366/original/image-3464747a20a5a8834f577c6ca2f66b5f.jpg",
        tiny_image_url: "https://deplyv9vomqtj.cloudfront.net/pages/images/26366/tiny/image-3464747a20a5a8834f577c6ca2f66b5f.jpg",
        small_image_url: "https://deplyv9vomqtj.cloudfront.net/pages/images/26366/small/image-3464747a20a5a8834f577c6ca2f66b5f.jpg",
        medium_image_url: "https://deplyv9vomqtj.cloudfront.net/pages/images/26366/medium/image-3464747a20a5a8834f577c6ca2f66b5f.jpg",
        large_image_url: "https://deplyv9vomqtj.cloudfront.net/pages/images/26366/large/image-3464747a20a5a8834f577c6ca2f66b5f.jpg"
      }
    }

    ExpandedPageData = PageData.merge({
      meta: {
        totals: {
          total_amount_cents: 0,
          online_amount_cents: 0,
          offline_amount_cents: 0,
          gift_aid_amount_cents: 0,
          total_donations: 0,
          total_donations_offline: 0,
          total_donations_offline: 0,
          currency: {
            iso_code: "AUD",
            name: "Australian Dollar",
            symbol: "$"
          }
        }
      }
    })

    Page = {
      page: PageData
    }

    Pages = {
      pages: [PageData]
    }

    CreatedPage = {
      page: PageData.merge({campaign_date: nil}),
      meta: {
        url: "https://test-campaign-for-api.edheroz.com/au/tim"
      },
    }

    TeamPageData = {
      id: 2511,
      slug: "my-new-team",
      gift_aid_eligible: false,
      charity_uid: "au-20",
      campaign_uid: "au-305",
      owner_uid: 273,
      owner_type: "Team",
      uid: 2511,
      state: "active",
      target_cents: 50050,
      name: "My New Team",
      team_uid: nil,
      team_member_uids:[2509],
      team_leader_page_uid: 2509,
      expires_at: "2015-06-30T00:00:00.000Z",
      amount: {
        cents: 0,
        currency: {
          iso_code: "AUD",
          name: "Australian Dollar",
          symbol: "$"
        }
      },
      cached_offline_amount_cents: 0,
      campaign_date: nil,
      fitness_activity_overview: {},
      story: "I've created this page because I want to make a difference. I'm inspired by the work of Test Charity for messaging and wanted to support them by raising money as part of my participation in Sandbox2. Please help me help them by giving whatever you can using the 'Give Now' button. The more people that know about Test Charity for messaging, the greater their impact, so please also spread the word by sharing my page with your friends and family. Thank you in advance for your generosity, it means a lot!\n",
      image: {
        original_image_url: "https://dqw0wvb05w98x.cloudfront.net/assets/pages/images/original/missing.gif",
        tiny_image_url: "https://dqw0wvb05w98x.cloudfront.net/assets/pages/images/tiny/missing.gif",
        small_image_url: "https://dqw0wvb05w98x.cloudfront.net/assets/pages/images/small/missing.gif",
        medium_image_url: "https://dqw0wvb05w98x.cloudfront.net/assets/pages/images/medium/missing.gif",
        large_image_url: "https://dqw0wvb05w98x.cloudfront.net/assets/pages/images/large/missing.gif"
      },
      created_at: "2015-04-07T04:33:51.708Z",
      updated_at: "2015-04-07T04:33:51.801Z",
      url: "https://sandbox2.edheroz.com/au/my-new-team",
      invitation_id: nil,
      coordinate: {
        lat: -27.46,
        lon: 153.03
      }
    }

    Teampage = {
      page: [TeamPageData]
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
          uid: 'au-123',
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
          uid: 'au-456',
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
          id: 2030,
          country_code: "au",
          active: true,
          name: "Helen",
          slug: "helen-17",
          supporter: {
            uid: "899",
            name: "Helen Ross"
          },
          campaign: {
            uid: "au-0",
            name: "Everyday Hero",
            url: "http://core-au.edheroz.com",
            get_started_url: "https://give.edheroz.com/au/get-started"
          },
          charity: {
            uid: "au-8",
            name: "XYZ Charity",
            url: "http://core-au.edheroz.com/charity/view?charity=8",
            get_started_url: "https://give.edheroz.com/au/xyz-charity/get-started"
          },
          image_url: "https://dqw0wvb05w98x.cloudfront.net/pages/images/2030/original/blob-2e696a58efadbf869442e72b82cad667.",
          url: "https://give.edheroz.com/au/helen-17",
          expired: false,
          expires_at: "2014-11-09T04:19:38.000Z",
          type: "User",
          image: {
            original_image_url: "https://dqw0wvb05w98x.cloudfront.net/pages/images/2030/original/blob-2e696a58efadbf869442e72b82cad667.",
            tiny_image_url: "https://dqw0wvb05w98x.cloudfront.net/pages/images/2030/tiny/blob-2e696a58efadbf869442e72b82cad667.",
            small_image_url: "https://dqw0wvb05w98x.cloudfront.net/pages/images/2030/small/blob-2e696a58efadbf869442e72b82cad667.",
            medium_image_url: "https://dqw0wvb05w98x.cloudfront.net/pages/images/2030/medium/blob-2e696a58efadbf869442e72b82cad667.",
            large_image_url: "https://dqw0wvb05w98x.cloudfront.net/pages/images/2030/large/blob-2e696a58efadbf869442e72b82cad667."
          },
          _score: 1.2133026,
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
