require_relative "../../acceptance/spec_helper"

describe "Users" do
  it "GET /register" do
    get "/register"
    body.should =~ /Register/
  end

  it "POST /users" do
    users = User.all
    post "/users", { username: { username: "antani", password: "sblinda", password_confirmation: "sblinda" } }
    referer.should == "/"
    User.all.count.should == users.size+1
  end
end