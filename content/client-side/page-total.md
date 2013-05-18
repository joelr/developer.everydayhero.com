---
title: Page totals
---

## Individual page total

Using the [pages endpoint](/pages/) with a .jsonp and callback option you can include a page total on a website.

Below shows a demo JQuery snippet that will load the page total on to a page.

<pre>
  <code class="javascript">&lt;script src=&quot;http://code.jquery.com/jquery-latest.min.js&quot;&gt;&lt;/script&gt;
&lt;script type='text/javascript'&gt;

  $(function() {
    $.getJSON('https://everydayhero.com/api/v2/pages/123.jsonp?callback=?', {},  function (data) {          
      var funds = data.page.amount;
      $('#raised').html(funds.currency.symbol + (funds.cents / 100) + &quot; raised&quot;);
    })  
  });  

&lt;/script&gt;

&lt;div id='raised'&gt;&lt;/div&gt;</code>
</pre>
 
Will display

_$1234 raised_

