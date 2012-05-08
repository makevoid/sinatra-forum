require "spec_helper"

describe User do
  let(:forum){ Forum.create name: "foro"  }
  let(:post){ forum.posts.create title: "one", text: "one", user: user }

  it "replies to a post" do
    post2 = user.reply( post, { title: "two", text: "two" })
    post2.save
    user.posts.should include(post2)
  end

  context "roles" do

    it "has roles" do
      User::ROLES.should be_an(Array)
    end

    it "defaults to :guest" do
      User.new.role.should == :guest
    end

    it "defines ROLES methods" do
      User.new.admin?.should  be_false
      User.new.member?.should be_false
      User.new.guest?.should  be_true
    end

  end
end