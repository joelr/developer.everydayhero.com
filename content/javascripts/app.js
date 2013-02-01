$(function() {
  var $container = $('#api-status span');

  $.getJSON('http://localhost:3004/api/v1/status.json', function(data) {
    $container.text('Available');
  });
});
