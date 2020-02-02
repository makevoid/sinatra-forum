require_relative "../../acceptance/spec_helper"

describe "Sessions" do
  
  it "GET /login" do
    get "/login"
    body.should =~ /Login/
  end

  context "POST /sessions" do
    it "logs in" do
      user = factory User
      post "/sessions", user: { username: user.username, password: "sblinda" }
      referer.should == "/"
      #session[:user_id].should == user.id
      # TODO: pending "fails"
    end

    it "displays login alert" do
      post "/sessions"
      body.should =~ /Invalid username or password/
    end
  end

  it "POST /logout" do
    post "/logout", {}, session: { user_id: 1 }
    referer.should == "/"
    # session[:user_id].should be_nil
    # TODO: pending "fails"
  end

end
