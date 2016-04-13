$(function(){
  // dynamically alter the playlist's height
  $('.spotify-iframe').css('height', $(window).height()-200+'px');

  // focus cursor on playlist's title input
  $('.playlist-title-input').focus();
});
