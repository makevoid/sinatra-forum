require "spec_helper"
require "#{PATH}/lib/icons_helpers"

class Stub
  include IconsHelpers
end

describe "IconsHelpers" do
  it "iconize" do
    Stub.new.iconize("aa :asd: bb").should == "aa <img src='/images/icons/asd.gif' class='icon' /> bb"
  end

  it "icon_not_found" do
    Stub.new.iconize(":antanifoti:").should == "<img src='#{Stub.new.send :icon_not_found}' class='icon' />"
  end
end