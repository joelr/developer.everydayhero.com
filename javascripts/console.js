function load_api_content(url) {
    $('#console').html("Loading");
    var url= "https://edheroz.com/api/v2/" + url;
    url = url.replace("?","");
    url = url.replace(".json",".jsonp?callback=?&");
    var jqxhr = $.getJSON(url, function(data) {
       var stringify = JSON.stringify(data, undefined, 2);
       var prettify = hljs.highlightAuto(stringify).value;
       prettify = hljs.fixMarkup(prettify);
       $('#console').html(prettify);
     });
     setTimeout(function(){
       if ($('#console').html() == "Loading") {
        $('#console').html("Error");
       }
     },8000);
}
