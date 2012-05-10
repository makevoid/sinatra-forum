module IconsHelpers
  def iconize(text)
    text.gsub(/:([\w_-]+):/) { "<img src='#{Icon.find($1) || icon_not_found}' class='icon' />" } if text
  end

  private

  def icon_not_found
    "/"
  end
end