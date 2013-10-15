$(document).ready(function() {
  $('#jmenu').find('li').mouseenter(function() {
    $(this).children('ul').show();
    $(this).addClass('selected');
    $(this).mouseleave(function() {
      $(this).children('ul').hide();
      $(this).removeClass('selected');
    });
  });
});