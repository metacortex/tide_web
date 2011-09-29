// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require ./lib/underscore-min.js
//= require_tree ./lib
//= require_tree ./coffeescripts


$(".ajax-link").live("click", function() {
	var url = $(this).attr("data-url");
	var dom = $(this).attr("data-dom");
	$.get(url, function(data) {
		$(dom).html(data);
	})
})

var close_modal = function(id) {
	$("#lean_overlay").fadeOut(200);
	$(id).css({"display":"none"});
}
