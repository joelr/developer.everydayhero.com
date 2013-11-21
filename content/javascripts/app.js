$(function() {
  var $container = $('#api-status span');

  $.getJSON('http://everydayhero.com/api/v2/status.jsonp?callback=?', function(data) {
    $container.addClass('available');
    $container.removeClass('down');
    $container.text('Available');
  });

  $('#run').click(function() {  
    load_api_content($('#path').val());
  });

  var query = $.url().param('query');
  if (query) {
    $('#path').val(query);
    load_api_content(query);
  }
});
