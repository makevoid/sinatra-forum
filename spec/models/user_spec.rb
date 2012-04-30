require "spec_helper"

describe User do
  let(:forum){ Forum.create name: "foro"  }
  let(:post){ forum.posts.create title: "one", text: "one", user: user }

  it "replies to a post" do
    post2 = user.reply( post, { title: "two", text: "two" })
    post2.save
    user.posts.should include(post2)
  end
end