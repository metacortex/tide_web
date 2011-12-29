// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
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




/* POST CREATE/EDIT */

function setPostFormAs(mode) {
  $("#post_kind_" + mode).attr("checked", true);
  
  if (mode == 'compose') {
    $("#post_source_url").parent("li").hide();
    $("#remote_image_selector").hide();
  } else {
    $("#post_source_url").parent("li").show();
    $("#remote_image_selector").show();
  }
  
  return false;
}

function updateRemotePictureList(element) {
  var url = $(element).val();
  if (url.length == 0) return;
  
  $.ajax({
    url: url,
    type: 'GET',
    success: function(data, textStatus, jqXHR) {
      var doc = data.responseText;
      var re = new RegExp('<img [^>]*src=".*?[^\]"[^>]*/>', 'g');
      var rs = new RegExp('<img [^>]*src=".*?[^\]"[^>]*/>', 'g');
      var ms = doc.match(re);
      var images = [];
      for (var i=0; i<ms.length; i++) {
        var src = $(ms[i]).attr("src");
        if (src) {
          var img = new Image();
          img.src = src;
          images.push(img);
        }
      }
      var html = "";
      for (var i=0; i<images.length; i++) {
        var img = images[i];
        if (img.width * img.height > 50000) {
          var src = img.src;
          html += "<li><a href=\"#\" onclick=\"return setRemotePicture('" + src + "',this);\"><img src='" + src + "' /></a></li>";
        }
      }
      if (html.length < 1) html = "<li class=\"message\">(no data)</li>";
      $("#remote_picture_images").html(html);
    }
  });
}

function setRemotePicture(url,element) {
  $("#post_remote_picture_image_url").val(url);
  $("#post_picture_image").val("");
  
  $(element).parent("li").addClass("selected");
  $(element).parent("li").siblings().removeClass("selected");
  
  return false;
}
