function article(){
  if($(".article").length <= 0)
    return;
  $("a:eq(0)").remove();
  $(window).scroll(function(){
    if($(this).scrollTop() != 0) {
      $('#toTop').fadeIn();
    }
    else {
      $('#toTop').fadeOut();
    };
  });
  $('#toTop').click(function() {
    $('body,html').animate({scrollTop:0},800);
  });
};
