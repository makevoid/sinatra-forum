require "spec_helper"

describe Icon do
  it "has icons in icons dir" do
    path = File.expand_path "../../../", __FILE__
    File.exist?("#{path}/public/images/icons/asd.gif").should be_true
  end

  it "#all" do
    icons = Icon.all
    icons.should be_an(Array)
    icons.first.should be_an(Icon)
  end

  it "#find" do
    Icon.find("asd").should == "/images/icons/asd.gif"
  end
end