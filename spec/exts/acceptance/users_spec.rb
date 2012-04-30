require_relative "../../acceptance/spec_helper"

describe "Users" do
  it "GET /users" do
    get "/users"
    body.should include(user.username)
  end

  it "GET /users/:id" do
    get "/users/#{user.id}"
    body.should include(user.username)
  end

  it "GET /register" do
    get "/register"
    body.should =~ /Register/
  end

  context "POST /users" do
    it "creates user" do
      users_count = User.all.count
      post "/users", { user: { username: "antani", password: "sblinda", password_confirmation: "sblinda" } }
      referer.should == "/"
      User.all.count.should == users_count+1
    end

    it "displays validations" do
      post "/users", { user: { username: "antani2", password: "sblinda", password_confirmation: "sblinda2" } }
      body.should =~ /Password and Confirmed password have different values/
    end
  end

end