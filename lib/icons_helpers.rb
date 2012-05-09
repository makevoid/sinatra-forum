module IconsHelpers
  def iconize(text)
    text.gsub(/:([\w_-]+):/, "<img src='#{Icon.find($~) || icon_not_found}' />") if text
  end

  private

  def icon_not_found
    "/"
  end
end