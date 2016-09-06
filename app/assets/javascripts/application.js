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
})()
