// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
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
