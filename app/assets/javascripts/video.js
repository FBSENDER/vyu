function video(){
  if($(".video").length <= 0)
    return;
  // init youku api
  ykjsapi();
  
  // set jwplayer
  jwplayer.key="nWN+D87YaKXxihWbtL316egGubuntsJbRAgpFA==";
  window.set_jwplayer = function(src){
    var ww = document.getElementById('ykplayer0').clientWidth;
    var hh = ww*0.5625;
    var tt = 'mp4';
    if(src.indexOf('/flv/') > 0)
      tt = 'flv';
    var jwp = jwplayer('ykplayer0')
      jwp.setup({
        file:src,
        type:tt,
        height: hh,
        width: ww,
        players:[
        {type: "flash", src: 'http://www.vxixi.com/jwplayer.flash.swf'},
        {type: 'html5'}
        ],
      });
    jwp.on('error',function(e){
      if(e.message == 'Error loading media: File could not be played'){
        $('#ykplayer0').append("<div class='hidden'><iframe src='http://www.youku.com'></iframe></div>");
        $('div.jw-title-primary.jw-reset').html("服务器开小差了，请刷新页面试一试~");
        $('#source_link_p_0').removeClass('hidden');
        var lk = $('#source_link_a_0').data('original');
        $('#source_link_a_0').attr({href: lk});
      }
    });
  }
  
  var vid = $("#vid").val();
  var bd_player = new JWP({client_id: '82ca06da2497bd12', vid: vid, target: 'ykplayer0'});
  bd_player.selectH5MP4();

}
