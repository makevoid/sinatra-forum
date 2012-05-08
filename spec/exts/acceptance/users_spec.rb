require_relative "../../acceptance/spec_helper"

describe "Users" do

  it "GET /users" do
    user = factory User
    get "/users"
    body.should include(user.username)
  end

  it "GET /users/:id" do
    user = factory User
    get "/users/#{user.id}"
    body.should include(user.username)
  end

  it "GET /register" do
    get "/register"
    body.should =~ /Register/
  end

  context "POST /users" do
    let(:process!) { post "/users", { user: { username: "antani2", password: "sblinda", password_confirmation: "sblinda" } } }

    it "creates user" do
      users_count = User.all.count
      process!
      referer.should == "/"
      User.all.count.should == users_count+1
    end

    it "logins user" do
      process!
      # p session[:user_id]
      # TODO: pending
    end

    it "displays validations" do
      post "/users", { user: { username: "antani2", password: "sblinda", password_confirmation: "sblinda2" } }
      body.should =~ /Password and Confirmed password have different values/
    end

  end

  it "GET /users/:id/edit" do
    get "/users/#{user.id}/edit"
    body.should =~ /Edit/
  end

  it "PUT /users/:id" do
    put "/users/#{user.id}", user: { signature: "antani" }
    User.get(user.id).signature.should == "antani"
  end

end