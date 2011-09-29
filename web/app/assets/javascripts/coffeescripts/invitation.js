$(function(){

var f = $("#invitations");

if (f.length > 0) {
  moreFriendForm();  
}




// Under Construction!
$("a.comming_soon, .comming_soon a").bind("click", function(){ alert("Under Construction");return false;});



// LeanModal
$(".modal").leanModal();


// bxSlider
$('#banner_slider').bxSlider({
  // ticker: true,
  // tickerSpeed: 800,
  auto: true,
  speed: 400,
  controls: false
});


});
