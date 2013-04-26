$(function() {
  var $container = $('#api-status span');

  $.getJSON('http://everydayhero.com/api/v2/status.json', function(data) {
    $container.text('Available');
  });
});
