$.fn.fadeIn = ->
  @css display: "block", opacity: 0
  @animate { opacity: 1 }, 1000

$.fn.fadeOut = ->
  @css display: opacity: 1
  @animate { opacity: 0 }, 1000, {}, => 
    @css display: "none"

extended_click = (elems) ->
  $(elems).on "click", (evt) ->
    url = $(this).find("a").first().attr "href"
    document.location = url

$ ->
  extended_click ".forums .forum, .posts .post, .users .user"
  
  $(".reply_btn").on "click", ->
    $(@).hide()
    $(".reply").fadeIn()
    
  $(".choose_btn").on "click", ->
    $(".avatars").show()
    $(".avatars img").on "click", ->
      url = $(this).attr "src"
      $("#avatar").val url