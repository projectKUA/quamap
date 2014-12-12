// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
$(function() {
var
preFunc = null,
preInput = '',
input = '',
ajaxPost = function(input)
{
  $.ajax({
     url: "quas/ajax_qua_list",
      type: "GET",
      data: ("q=" + input),
      success: function (result) {
        $('div.qua_search_result').on("click", function() {
           var qua = $(this).find('div.qua_info').text().split(',');
           var lat = qua[2];
           var lon = qua[3];
           mapObj.panTo(new google.maps.LatLng(lat, lon));
           if(qua[0] !== null){
             var qua_id = qua[0].trim();
             arrInfoWindows[qua_id].open(mapObj,arrQuaMarkers[qua_id]);
           }
        });
      }
  });
};

$('#inc_search').on('keyup', function() {
  var parent = $(this).closest("div");
  input = $.trim($(this).val());   //前後の不要な空白を削除
  if(preInput !== input){
    clearTimeout(preFunc);
    preFunc = setTimeout(ajaxPost(input), 500);
    getLatLngFromKeyword(input);
  }
  preInput = input;
  if ($('div.qua_search_result') == null ) {$('ul#qua_list').hide()};
  if ($('#menu input').val() != "" && $('div.qua_search_result').length > 0){
    $('ul#qua_list').show();
  } else {
    $('ul#qua_list').hide();
  }
});
});

