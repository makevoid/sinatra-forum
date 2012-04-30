require_relative "../../acceptance/spec_helper"

describe "Sessions" do
  it "GET /login" do
    get "/login"
    body.should =~ /Login/
  end

  context "POST /sessions" do
    it "logs in" do
      post "/sessions", user: { username: user.username, password: "sblinda" }
      referer.should == "/"
    end

    it "displays login alert" do
      post "/sessions"
      body.should =~ /Invalid username or password/
    end
  end

  it "POST /logout" do
    #session[:user_id] = 1
    post "/logout"
    referer.should == "/"
    pending "need session"
    #session[:user_id].should be_nil
  end
end