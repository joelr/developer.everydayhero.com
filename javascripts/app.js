$(function() {
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
