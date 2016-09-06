function guize(){
  if($(".guize").length <= 0)
    return;
  document.addEventListener('turbolinks:before-visit', function(e) {
    var source_href = window.location.href.split('#')[0];
    if (e.data.url.split(source_href)[1].length > 0) {
      e.preventDefault();
      window.location.href = e.data.url;
    }
  });
  $('body').scrollspy({target: '#doc-sidebar'});
  $(window).scroll(function(){
    var $ul = $('#doc-sidebar ul')
    if($(this).scrollTop() > 80){
      if($ul.css('top') != '20px'){
        $ul.animate({top: "20px"},0);
        $('#bt_logo').removeClass('hide');
        $('#bt_logo').fadeIn("slow");
      }
    }
    else{
      if($ul.css('top') == '20px'){
        $ul.animate({top: "72px"},0);
        $('#bt_logo').fadeOut("slow");
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
