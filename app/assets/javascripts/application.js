// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
$.ready(function(){
  $('#topbar').dropdown();
});

window.fbAsyncInit = function() {
        FB.init({
          appId      : '152460108176191',
          status     : true, 
          cookie     : true,
          xfbml      : true,
          oauth      : true,
        });
      };
      (function(d){
          var js, id = 'facebook-jssdk'; if (d.getElementById(id)) {return;}
          js = d.createElement('script'); js.id = id; js.async = true;
          js.src = "//connect.facebook.net/en_US/all.js";
          d.getElementsByTagName('head')[0].appendChild(js);
        }(document));
