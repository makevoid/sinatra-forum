require "spec_helper"

describe Icon do
  it "all" do
    icons = Icon.all
    icons.should be_an(Array)
    icons.first.should be_an(Icon)
  end
end