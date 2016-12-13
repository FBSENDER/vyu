function run_changyan(){
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
};
