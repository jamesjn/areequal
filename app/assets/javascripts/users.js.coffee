# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(".arts_listing_edit").live "click", (event)->
  window.location = ("arts/" + $(this).attr("data-id") + "/edit")


$("#unsubscribe").live "click", (event) ->
  user_id = $(this).attr("data-user-id")
  $.post "http://www.jamesjn.com/areequal/follows/unsubscribe", {user_id:user_id}, (data) ->
    if data["unsubscribed"] == true
      alert "unsubscribed"
