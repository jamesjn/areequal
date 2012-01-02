# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$("#art_art1_type, #art_art2_type").live "change", (event) ->
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
  "<span onclick=\"$('#{'#'+el_id+'_uploader'}').click()\" class=\"btn\">Upload Art</span> <input id=\"#{el_id+'_uploader'}\" type=\"file\" style=\"display:none\" onchange=\"upload(this.files[0], '#{el_id}')\">"

video_selector = () ->
  "Video selector"

text_selector = () ->
  "Text selector"

