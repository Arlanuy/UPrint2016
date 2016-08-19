// This js file prepares the web application, especially the landing page.
$(document).ready(function() {
  $('#bottomPage .bottomPagePart').transition('toggle');
  $('#topPage').transition('toggle');
  $("#UPrint").transition('toggle');

  $('.ui.checkbox').checkbox();

      $('#fullpage').fullpage({
        anchors: ['about', 'home'],
        navigation: true,
        navigationPosition: 'left',

        afterLoad: function(anchorLink, index){
          var loadedSection = $(this);

          //using anchorLink
      if(anchorLink == 'home'){
        $('#UPrint').transition('fade down');
            $('#bottomPage .bottomPagePart').transition({
              animation: 'fade down',
              duration: 800,
              interval: 600
            });
      }else if(anchorLink == 'about'){
        $('#topPage').transition('fade up');
      }
    },

    onLeave: function(index, nextIndex, direction){
              var leavingSection = $(this);

              //after leaving section 2
              if(index == 2 && direction =='up'){
                  $('#bottomPage .bottomPagePart').transition('fade up');
                  $('#UPrint').transition('fade up');
              }else if(index == 1 && direction == 'down'){
                $('#topPage').transition('fade down');
              }
         }
      });
});

function flipOver() {
  $('.shape').shape('flip over');
  if($('#flip').html() == 'Login') $('#flip').html('Signup');
  else $('#flip').html('Login');
}

function signInStudent(){
  $('#signin-student').css("display", "block");
  $('#signin-shop').css("display", "none");
}

function signInShop(){
  $('#signin-shop').css("display", "block");
  $('#signin-student').css("display", "none");
}

function signUpStudent(){
  $('#email-label').text('UP Webmail');
  $('#email-input').prop("placeholder", "UP Webmail");
  $('#signupModal').prop('value', 'student');
}

function signUpShop(){
  $('#email-label').text('Email');
  $('#email-input').prop("placeholder", "Email");
  $('#signupModal').prop('value', 'shop');
}

function signUp(){
  if($('#signupModal').prop('value') == 'student'){
    $('#studentModal').modal('show');
    $("#email-input-modal").val($("#email-input").val());
    $("#password-input-modal").val($("#password-input").val());
  }else{
    $('#shopModal').modal('show');
  }
  $("#shop_email").val($("#email-input").val());
  $("#shop_password").val($("#password-input").val());
}
