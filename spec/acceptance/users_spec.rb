require_relative "spec_helper"

describe "Users" do
  it "GET /register" do
    get "/register"
    body.should =~ /Register/
  end
end