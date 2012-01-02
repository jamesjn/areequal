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

$("#login-facebook-button").live("click", function(){
  FB.login(function(response){
    var uid = response.authResponse.userID;
    var signed_request = response.authResponse.signedRequest;
    FB.api('/me', function(response) {
      var fb_res = response;
        $.post("/areequal/login", {'signed_request':signed_request, 'fb_response':fb_res}, function(data){
          if(data["verified"] = true){
            $("#login-dropdown").show(); 
            $("#login-facebook-button").hide(); 
            $("#login-google-button").hide(); 
            $("#logged-in-as").html(fb_res.name);
          }
          else{
            alert("Invalid User");
          }
        });
    });
  
  }); 
});

$("#logout-button").live("click", function(){
  FB.logout(function(response){
    $("#login-dropdown").hide(); 
    $("#login-facebook-button").show(); 
    $("#login-google-button").show(); 
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
            $("#login-facebook-button").hide(); 
            $("#login-google-button").hide(); 
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


upload = function (file, dom) {
 
  if (!file || !file.type.match(/image.*/)) return;
 
  var fd = new FormData();
  fd.append("image", file); // Append the file
  fd.append("key", "b1507316815a853a7a23318ff905a486");
  var xhr = new XMLHttpRequest();
  xhr.open("POST", "http://api.imgur.com/2/upload.json");
  xhr.onload = function() {
    image_loc = JSON.parse(xhr.responseText).upload.links.imgur_page;
    $(dom+'_picture').html('<img src="'+image_loc+'.jpg'+'" alt="Art 1" height="50"  />');
    $(dom+'_button').hide();
   }
   xhr.send(fd);
}

