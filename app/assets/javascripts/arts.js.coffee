# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$("#art1, #art2").live "change", (event) ->
  switch $(this).attr('value') 
    when "Image"
      $("#" + $(this).attr("id") + "_picture").hide()
      $("#" + $(this).attr("id") + "_selector").show()
      $("#" + $(this).attr("id") + "_selector").html art_selector(this)
    when "Video"
      $("#" + $(this).attr("id") + "_picture").hide()
      $("#" + $(this).attr("id") + "_selector").show()
      $("#" + $(this).attr("id") + "_selector").html video_selector(this)
    when "Text"
      $("#" + $(this).attr("id") + "_picture").hide()
      $("#" + $(this).attr("id") + "_selector").show()
      $("#" + $(this).attr("id") + "_selector").html text_selector(this)
      
art_selector = (that) ->
  el_id = $(that).attr("id") 
  "<span onclick=\"$('#{'#'+el_id+'_uploader'}').click()\" class=\"btn\">Upload Art</span> <input id=\"#{el_id+'_uploader'}\" type=\"file\" style=\"display:none\" onchange=\"upload(this.files[0], '#{el_id}')\"> <input id=\"#{el_id}_info\" type=\"hidden\" name=\"art[#{el_id}_info]\">"

video_selector = (that) ->
  el_id = $(that).attr("id") 
  "URL: <input id=\"#{el_id+'_info'}\" name=\"art[#{el_id}_info]\" class=\"span5\" type=\"text\" size=\"20\" >"

text_selector = (that) ->
  el_id = $(that).attr("id") 
  "Text: <input id=\"#{el_id+'_info'}\" name=\"art[#{el_id}_info]\" class=\"span5\" type=\"text\" size=\"20\" >"


$("#add_to_favorites").live "click", (event) ->
  art_id = $(this).attr("data-art-id")
  $.post "http://www.jamesjn.com/areequal/favorites", {art_id:art_id}, (data) ->
    if data["favorited"] == true
      $("#add_to_favorites").html("Favorited") 
      $("#add_to_favorites").attr("id", "Favorited") 

$("#add_to_followings").live "click", (event) ->
  owner_id = $(this).attr("data-owner-id")
  $.post "http://www.jamesjn.com/areequal/follows", {follow_id:owner_id}, (data) ->
    if data["following"] == true
      $("#add_to_followings").html("followed") 
      $("#add_to_followings").attr("id", "followed") 
