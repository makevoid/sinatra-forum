require "spec_helper"

describe "Auth" do
  it "should load models" do
    User.should be_a Class
  end
end