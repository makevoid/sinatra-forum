extended_click = (elems) ->
  $(elems).on "click", (evt) ->
    url = $(this).find("a").first().attr "href"
    document.location = url

$ ->
  extended_click ".forums .forum, .posts .post, .users .user"