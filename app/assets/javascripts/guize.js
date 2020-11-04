function guize(){
  if($(".guize").length <= 0)
    return;
  $("a:eq(0)").remove();
  document.addEventListener('turbolinks:before-visit', function(e) {
    var source_href = window.location.href.split('#')[0];
    if (e.data.url.split(source_href)[1].length > 0) {
      e.preventDefault();
      window.location.href = e.data.url;
    }
  });
  $('body').scrollspy({target: '#doc-sidebar'});
  $(window).scroll(function(){
    var $ul = $('#doc-sidebar ul');
    var $rd = $('#related_right');
    var $pop_ad = $('#pop_ad');
    $pop_ad.hide();
    if($(this).scrollTop() > 80){
      if($ul.css('top') != '20px'){
        $ul.animate({top: "20px"},0);
        $('#bt_logo').removeClass('hide');
        $('#bt_logo').fadeIn("slow");
      }
      if($rd.css('top') != '-50px'){
        $rd.animate({top: "-50px"},0);
      }
    }
    else{
      if($ul.css('top') == '20px'){
        $ul.animate({top: "72px"},0);
        $('#bt_logo').fadeOut("slow");
      }
      if($rd.css('top') == '-50px'){
        $rd.animate({top: "0"},0);
      }
    };
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
