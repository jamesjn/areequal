// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-dropdown
//= require_tree .
$.ready(function(){
  $('#topbar').dropdown();
});

$("#login-button").live("click", function(){
  FB.login(function(response){
    FB.api('/me', function(response) {
      var fb_res = response;
      $("#login-dropdown").show(); 
      $("#login-button").hide(); 
      $("#signup-button").hide(); 
      $("#logged-in-as").html(fb_res.name);
    });
    var uid = response.authResponse.userID;
    var signed_request = response.authResponse.signedRequest;
    $.post("/areequal/login", {'signed_request':signed_request}, function(){
    });
  
  }); 
});

$("#logout-button").live("click", function(){
  FB.logout(function(response){
    $("#login-dropdown").hide(); 
    $("#login-button").show(); 
    $("#logged-in-as").html();
  });
});

window.fbAsyncInit = function() {
        FB.init({
          appId      : '152460108176191',
          status     : true, 
          cookie     : true,
          xfbml      : true,
          oauth      : true,
        });
        FB.getLoginStatus(function(response) {
          if (response.status === 'connected') {
            var uid = response.authResponse.userID;
            var accessToken = response.authResponse.accessToken;
            $("#login-dropdown").show(); 
            $("#login-button").hide(); 
            $("#logged-in-as").html(uid);
            
          } else if (response.status === 'not_authorized') {
            // the user is logged in to Facebook, 
            //but not connected to the app
          } else {
            // the user isn't even logged in to Facebook.
          }
        });
      };
(function(d){
  var js, id = 'facebook-jssdk'; if (d.getElementById(id)) {return;}
  js = d.createElement('script'); js.id = id; js.async = true;
  js.src = "//connect.facebook.net/en_US/all.js";
  d.getElementsByTagName('head')[0].appendChild(js);
}(document));

