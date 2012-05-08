module MarkdownHelpers

  alias :tag, :haml_tag
  alias :concat, :haml_concat

  HELPS = [
    ["Bold",    "**word**"],
    ["Italic",  "*word*"],
    ["Link",    "<http://example.com>"],
    ["Bold",    "**word**"],
    ["Link2",    "[example](http://example.com)"],
    ["Bold",    "**word**"],
    ["Bold",    "**word**"],

  ]

  def markdown_help(name, definition)
    tag :li do
      tag :div, class: "name" { haml_concat name }
      tag :div, class: "md"   { haml_concat definition }
      tag :div, class: "html" { haml_concat definition }
    end
  end

end