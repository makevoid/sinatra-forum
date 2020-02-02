require "spec_helper"

describe "Auth" do

  it "should load models" do
    User.should be_a Class
  end

  context "before create" do
    it "generates a salt" do
      user = User.create username: "antani", password: "sblinda", password_confirmation: "sblinda"
      user.salt.should_not be_nil
    end

    it "generates a password" do
      user = User.create username: "antani", password: "sblinda", password_confirmation: "sblinda"
      user = User.get user.id
      user.password.should_not == "sblinda"
      user.password?("sblinda").should be_true
    end
  end

  after :each do
    DataMapper.repository(:default).adapter.execute "TRUNCATE TABLE users;"
  end
  
end
