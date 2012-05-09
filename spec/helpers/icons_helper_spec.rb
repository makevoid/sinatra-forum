class Stub
  include IconsHelpers
end

describe "Stub" do
  it "iconize" do
    Stub.new.iconize(":asd:").should == "<img src='/images/icons/asd.gif' />"
  end
end