---
title: Campaign totals
---

## Individual campaign total

Using the [campaigns endpoint](/campaigns/) with a .jsonp and callback option you can include campaign totals on websites.

Below shows a demo JQuery snippet that will load the campaign total on to a page.

<pre>
  <code class="javascript">&lt;script src=&quot;http://code.jquery.com/jquery-latest.min.js&quot;&gt;&lt;/script&gt;
&lt;script type='text/javascript'&gt;

  $(function() {
    $.getJSON('https://everydayhero.com/api/v2/campaigns/au-1234.jsonp?callback=?', {},  function (data) {          
      var funds = data.campaign.funds_raised;
      $('#raised').html(funds.currency.symbol + (funds.cents / 100) + &quot; raised&quot;);
    })  
  });  

&lt;/script&gt;

&lt;div id='raised'&gt;&lt;/div&gt;</code>
</pre>
 
Will display

_$1000 raised_

