// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// 
// This js file allows a shop to toggle its availability from a switch in the
//   shop's home page.
$("#avail-switch").click(function() {
  $.ajax({
    url: '/shops/available',
    type: 'POST',
    success: function(result, status, xhr) {
      if($("#avail-switch").hasClass("on")) {
        $("#avail-switch").addClass("off").removeClass("on");
      } else {
        $("#avail-switch").addClass("on").removeClass("off");
      }
    }
  });
});
