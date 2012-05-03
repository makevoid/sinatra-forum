class String

  def blank?
    self == ""
  end

end

class NilClass
  alias :blank? :nil?
end

class DateTime
  def formatted
    strftime "%H:%M - %d %b %Y"
  end
end