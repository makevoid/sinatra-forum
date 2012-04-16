require "spec_helper"

describe User do
  let(:user){ User.create user: "antani" }
  let(:forum){ Forum.create name: "foro"  }
  let(:post){ forum.posts.create title: "one", text: "one", user_id: user.id  }

  it "replies to a post" do
    user.reply post, title: "two", text: "two"
    user.posts.should include(post)
  end
end