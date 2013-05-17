$(function() {
  var $container = $('#api-status span');

  $.getJSON('http://everydayhero.com/api/v2/status.jsonp?callback=?', function(data) {
    $container.addClass('available');
    $container.removeClass('down');
    $container.text('Available');
  });
});
