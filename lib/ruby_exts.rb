class String

  def blank?
    self == ""
  end

end

class NilClass
  alias :blank? :nil?
end