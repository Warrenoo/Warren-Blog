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
//= require jquery.turbolinks
//= require select2
//= require jquery.goup.min
//= require bootstrap
//= require bootstrap-markdown

$(function(){
  $.goup();
  select_select2($(".use_select2"));
  show_tooltip($("[data-toggle=tooltip]"));
});

function select_select2($select){
  $select.css("width","100%");
  $select.select2({
    placeholder: "请选择",
    allowClear: true,
    formatNoMatches: function(term){
      return "未找到匹配项";
    }
  });
}

function show_tooltip($obj){
  $obj.tooltip();
};
