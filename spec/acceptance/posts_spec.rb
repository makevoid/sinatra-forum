require_relative "spec_helper"

describe "Posts" do
  let(:forum){ Forum.create name: "foro"  }
  let(:post1){ forum.posts.create title: "one", text: "one", user_id: user.id  }

  it "GET /posts/:id" do
    get "/posts/#{post1.id}"
    body.should include(post1.title)
  end

  it "GET /forums/:forum_id/posts/new" do
    get "/forums/#{forum.id}/posts/new"
    body.should include("New post")
  end

  it "POST /forums/:forum_id/posts" do
    login
    posts_count = Post.count
    post "/forums/#{forum.id}/posts", post: { title: "Antani", text: "sblinda" }
    referer.should == "/forums/#{forum.id}"
    Post.count.should == posts_count+1
  end

  after :all do
    clear_db
  end
end