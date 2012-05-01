require_relative "spec_helper"

describe "Posts" do
  let(:forum){ Forum.create name: "foro"  }
  let(:post){ forum.posts.create title: "one", text: "one", user_id: user.id  }

  it "GET /posts/:id" do
    get "/posts/#{post.id}"
    body.should include(post.title)
  end

  it "GET /forums/:forum_id/posts/new" do
    get "/forums/#{forum.id}/posts/new"
    body.should include("New post")
  end

  after :all do
    clear_db
  end
end