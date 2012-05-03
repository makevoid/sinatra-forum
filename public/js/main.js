(function() {
  var extended_click;

  $.fn.fadeIn = function() {
    this.css({
      display: "block",
      opacity: 0
    });
    return this.animate({
      opacity: 1
    }, 1000);
  };

  $.fn.fadeOut = function() {
    var _this = this;
    this.css({
      display: {
        opacity: 1
      }
    });
    return this.animate({
      opacity: 0
    }, 1000, {}, function() {
      return _this.css({
        display: "none"
      });
    });
  };

  extended_click = function(elems) {
    return $(elems).on("click", function(evt) {
      var url;
      url = $(this).find("a").first().attr("href");
      return document.location = url;
    });
  };

  $(function() {
    extended_click(".forums .forum, .posts .post, .users .user");
    return $(".reply_btn").on("click", function() {
      $(this).hide();
      return $(".reply").fadeIn();
    });
  });

}).call(this);
