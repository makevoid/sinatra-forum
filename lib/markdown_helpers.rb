module MarkdownHelpers

  require "rdiscount"
  include Haml::Helpers

  alias :tag :haml_tag
  alias :concat :haml_concat

  HELPS = [
    ["Bold",    "**word**"],
    ["Italic",  "*word*"],
    ["Link",    "\<http://example.com\>"],
    ["Link2",   "[example](http://example.com)"],
    ["Heading", "# Big Heading"],
  ]

  def markdown(string)
    RDiscount.new(string).to_html if string
  end

  def markdown_helps
    HELPS.each do |name, definition|
      markdown_help name, definition
    end
  end

  private

  def markdown_help(name, definition)
    tag :li do
      tag(:div, class: "name") { haml_concat name }
      tag(:div, class: "md"  ) { haml_concat escape_arrows(definition) }
      tag(:div, class: "html") { haml_concat markdown(definition) }
    end
  end

  def escape_arrows(string)
    string.gsub(/>/, '&gt;').gsub(/</, '&lt;')
  end

end