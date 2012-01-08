# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(".arts_listing").live "click", (event)->
  window.location += ("/arts/" + $(this).attr("data-id"))
  
$("#landing-search-box").live "keypress", (event)->
  if event.keyCode == 13 #user pressed enter
    window.location.replace("/areequal/search/" + $(this).val())
