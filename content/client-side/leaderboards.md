---
title: Campaign totals
---

## Campaign leaderboard and page totals

Using the [campaigns leaderboard endpoint](/leaderboards/) and the [pages endpoint](/pages/) you can include leaderboard and page totals on a page.

Below shows a demo JQuery snippet that will load the campaign leaders, and page totals on to a page.


<pre>
<code class="javascript">&lt;script src="http://code.jquery.com/jquery-latest.min.js"&gt;&lt;/script&gt;
&lt;script type='text/javascript'&gt;
  var campaignLeaderboard = function(campaign_slug, campaign_uid, type, limit, callback) {
    $.getJSON('https://everydayhero.com/api/v2/campaigns/' + campaign_uid + '/leaderboard.jsonp?type=' + type + '&limit=' + limit + '&callback=?', function(leaderboard_data) {
      if (leaderboard_data.leaderboard.page_ids.length == 0) {
        callback([]);
        return;
      }
      $.getJSON('https://everydayhero.com/api/v2/pages.jsonp?ids=' + leaderboard_data.leaderboard.page_ids.join(',') + '&callback=?', function(page_data) {
        var leaderboard = $.map(leaderboard_data.leaderboard.page_ids, function(page_id, i) {
          var page = $.grep(page_data.pages, function(element) {
            return element.id == page_id;
          })[0];
          return {
            name: page.name,
            amount: '$' + (page.amount.cents / 100),
            url: 'http://' + campaign_slug + '.everydayhero.com/au/' + page.slug
          }
        });
        callback(leaderboard);
      });
    });
  };
  campaignLeaderboard('give', 'au-0', 'individual', 10, function(data) {
    $(data).each(function(i, item) {
      $('#leaderboard').append('&lt;li&gt;' + item.name + ' raised ' + item.amount + '&lt;/li&gt;');
    });
  });
&lt;/script&gt;

&lt;ul id='leaderboard'&gt;&lt;/ul&gt;</code>
</pre>
 
##This will display:

- Unions' Fire Appeal 2013 raised $81837.26
- Scott Malcolm raised $67655
- Rebuilding Dana raised $52715
- Michael Hassett raised $50250
- Anton raised $44170
- Wee Erin G xxx raised $40820
- Kicking Goals for Kids with Cancer raised $36950
- OzForex Foreign Exchange raised $31850
- Pritchard Francis Perth to Surf 2013 raised $30350
- Brothers1VBrothers raised $27707.6
