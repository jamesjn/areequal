# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(".arts_listing").live "click", (event)->
  window.location.replace("http://www.jamesjn.com/areequal/arts/" + $(this).attr("data-id"))
  
$("#landing-search-box").live "keypress", (event)->
  if event.keyCode == 13 #user pressed enter
    window.location.replace("http://www.jamesjn.com/areequal/search/" + $(this).val())

$("#filter_art_category, #filter_art_most, #filter_art_time").live "change", (event)->
  $.get "/areequal/arts/", { category: $("#filter_art_category").val(), sort: $("#filter_art_most").val(), time_range: $("#filter_art_time").val() }, (data) ->
    $("#art_area").html(data)  

$("#user_page_select").live "change", (event)->
  $.get "/areequal/"+ $(this).val(), {}, (data) ->
    $("#user_page_main").html(data)
