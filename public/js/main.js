(function() {
  var extended_click;

  extended_click = function(elems) {
    return $(elems).on("click", function(evt) {
      var url;
      url = $(this).find("a").first().attr("href");
      return document.location = url;
    });
  };

  $(function() {
    return extended_click(".forums .forum, .posts .post, .users .user");
  });

}).call(this);
