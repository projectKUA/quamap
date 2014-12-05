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
//= require_tree .
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
      data: ("q=" + input)
  });
};

$('#inc_search').on('keyup', function() {
  input = $.trim($(this).val());   //前後の不要な空白を削除
  if(preInput !== input){
    clearTimeout(preFunc);
    preFunc = setTimeout(ajaxPost(input), 500);
  }
  preInput = input;
});
});

