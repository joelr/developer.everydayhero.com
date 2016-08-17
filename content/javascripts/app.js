$(function() {
  $('#run').click(function() {
    load_api_content($('#path').val());
  });

  var query = $.url().param('query');
  if (query) {
    $('#path').val(query);
    load_api_content(query);
  }

  function heightCheck() {
    var sideBarHeight = $('.side-bar').height();

    if ($(window).height() < (sideBarHeight + 30)) {
      $('.side-bar').removeClass('fixed');
    } else {
      $('.side-bar').addClass('fixed');
    }
  }
  heightCheck();

  $(window).resize(function() {
    heightCheck();
  });
});
