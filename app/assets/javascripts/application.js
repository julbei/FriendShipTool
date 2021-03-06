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
//= require 'rest_in_place'
//= require turbolinks
//= require bootstrap
//= require_tree .

$(document).on("ready page:change", function() {
    $('.person-tooltip').tooltip();
});

function add_tag(group_id, accounting_id, tag_id) {  
  jQuery.ajax({
    url: "/groups/"+group_id+"/accountings/"+accounting_id+"/add_tag",
    type: "GET",
    data: {"tag_id" : tag_id},
    dataType: "html",
    success: function(data) {
      jQuery("#tags").html(data);
    }
  });
}