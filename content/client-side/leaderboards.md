---
title: Campaign totals
---

## Campaign leaderboard and page totals

Using the [campaigns leaderboard endpoint](/leaderboards/) and the [pages endpoint](/pages/) you can include leaderboard and page totals on a page.

Below shows a demo JQuery snippet that will load the campaign leaders, and page totals on to a page.

<pre>
  <code class="javascript">&lt;script src=&quot;http://code.jquery.com/jquery-latest.min.js&quot;&gt;&lt;/script&gt;
&lt;script type='text/javascript'&gt;

$(function() {
  $.getJSON('https://everydayhero.com/api/v2/campaigns/au-1234/leaderboard.jsonp?callback=?', {},  function (data) {          
    var pages = data.leaderboard.page_ids;
    $.getJSON('https://everydayhero.com/api/v2/pages.jsonp?ids=' + pages.join(',') + '&amp;callback=?', {},  function (data) {          

      $.each(data.pages, function(index, value) {  
        var raised = value.amount;
        $(&quot;#pages&quot;).append('&lt;li&gt;' + value.name + ' raised ' + raised.currency.symbol + (raised.cents / 100) + '&lt;/li&gt;');
      });   
    });
  });
});  


&lt;/script&gt;

&lt;ul id='pages'&gt;&lt;/ul&gt;</code>
</pre>
 
##This will display:

- Claire raised $100
- Sarah raised $70
- Bill raised $70
- John raised $50
- Bill raised $10
- Chris raised $10
- Jane raised $10
- Sam raised $5


