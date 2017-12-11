// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
// require jquery
// require jquery_ujs
// require bootstrap-sprockets
// require turbolinks
// require_tree .
//= require article
//= require changyan
//= require guize

$(document).on("turbolinks:load", function(){
  $('img.lazy[src=""]').lazyload({threshold: 200, effect: "fadeIn"});
  if($(".app").length <= 0){
    guize();
    article();
    run_changyan();
  }
  else{
    video();
  }
  if($("#need_taobao_convert_url").size() > 0){
    taodianjin(window,document);
  }
  if($("#content_list").size() > 0){
    $(window).on("scroll", function(){
      var more_products_url = $('.pagination a[rel=next]').attr('href');
      if(more_products_url && $(window).scrollTop() > $(document).height() - $(window).height() - 60){
        $('.pagination').html('');
        $.ajax({
          url: more_products_url,
          success: function(data){
            $("#content_list").append(data);
            $('img.lazy[src=""]').lazyload({threshold: 200, effect: "fadeIn"});
          }

        });
      }
      if(!more_products_url){
        $('.pagination').html('');
      }
    });
  }
  if($("#article_list").size() > 0){
    $(window).on("scroll", function(){
      var more_products_url = $('.pagination a[rel=next]').attr('href');
      if(more_products_url && $(window).scrollTop() > $(document).height() - $(window).height() - 60){
        $('.pagination').html('');
        $.ajax({
          url: more_products_url,
          success: function(data){
            $("#article_list").append(data);
            $('img.lazy[src=""]').lazyload({threshold: 200, effect: "fadeIn"});
          }

        });
      }
      if(!more_products_url){
        $('.pagination').html('');
      }
    });
  }
  if($("#search_fuli").size() > 0){
    $("#search_fuli").on('keypress', function(e){
      var _this = $("#search_fuli");
      if(e.keyCode == 13 && $.trim(_this.val()) != ''){
        Turbolinks.visit("/app/sale_search/" + encodeURIComponent($.trim(_this.val())));
      }
    });
  }
});

(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

var do_search = function(){
  var k = $("#keyword").val();
  if(k.trim() == ''){
    return;
  }
  $.ajax({
    url: "/app/search",
    type: "post",
    dataType: "json",
    data: {
      'keyword': k,
    },
    beforeSend: function(xhr){xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));},
    success: function(data){
      if(data.code == 1){
        Turbolinks.visit("/app/tag/" + data.tag + "/");
      }
      else{
        $("#message").html("哎呀 未找到...");
        $("#message").removeClass("hide");
      }
    }
  })
};
