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
});

(function(){
  var appid = 'cyrtgVHP2',
  conf = 'prod_60051f90ec47ba299643a1e1c83a5ae8';
var doc = document,
  s = doc.createElement('script'),
  h = doc.getElementsByTagName('head')[0] || doc.head || doc.documentElement;
s.type = 'text/javascript';
s.charset = 'utf-8';
s.src =  'http://assets.changyan.sohu.com/upload/changyan.js?conf='+ conf +'&appid=' + appid;
h.insertBefore(s,h.firstChild);
window.SCS_NO_IFRAME = true;
setTimeout(function(){$("#adv").parents("div").addClass("hidden");}, 5000);
})();

(function(){
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Fdf2a7189158cc645d90f29f95e975e4a' type='text/javascript'%3E%3C/script%3E"));
})();

(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
ga('create', 'UA-45497874-1', 'vxixi.com');
ga('send', 'pageview');
