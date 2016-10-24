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
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .

$(document).on("turbolinks:load", function(){
  guize();
  article();
  (function(){
    var appid = 'cyrtgVHP2';
    var conf = 'prod_60051f90ec47ba299643a1e1c83a5ae8';
    var width = window.innerWidth || document.documentElement.clientWidth;
    var loadJs=function(d,a){var c=document.getElementsByTagName("head")[0]||document.head||document.documentElement;var b=document.createElement("script");b.setAttribute("type","text/javascript");b.setAttribute("charset","UTF-8");b.setAttribute("src",d);if(typeof a==="function"){if(window.attachEvent){b.onreadystatechange=function(){var e=b.readyState;if(e==="loaded"||e==="complete"){b.onreadystatechange=null;a()}}}else{b.onload=a}}c.appendChild(b)};
    if(width < 960){
      $("#changyan_mobile_js").attr("src","http://changyan.sohu.com/upload/mobile/wap-js/changyan_mobile.js?client_id=cyrtgVHP2&conf=prod_60051f90ec47ba299643a1e1c83a5ae8&rrr=" + Math.random().toString());
      window.changyan = void 0;
      window.cyan = void 0;
    }
    else{
      loadJs("http://changyan.sohu.com/upload/changyan.js",function(){window.changyan.api.config({appid:appid,conf:conf})});
      window.changyan = void 0;
      window.cyan = void 0;
    }
  })();
});

(function(){
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Fdf2a7189158cc645d90f29f95e975e4a' type='text/javascript'%3E%3C/script%3E"));
})();

(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

