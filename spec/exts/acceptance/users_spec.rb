require_relative "../../acceptance/spec_helper"

describe "Users" do
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

    it "renders errors" do
      post "/users", { user: { username: "antani2", password: "sblinda", password_confirmation: "sblinda2" } }
      p body
    end
  end

end