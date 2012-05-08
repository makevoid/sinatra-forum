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
    post "/forums/#{forum.id}/posts", post: { title: "antani", text: "sblinda" }
    referer.should == "/forums/#{forum.id}"
    Post.count.should == posts_count+1
  end

  it "POST /posts/:post_id/reply" do
    login
    post_id = post1.id
    posts_count = Post.count
    post "/posts/#{post_id}/reply", post: { title: "antani too!", text: "sblinda" }
    referer.should == "/posts/#{post_id}"
    Post.count.should == posts_count+1
  end

  it "POST /posts/:post_id/reply invalid" do
    login
    post "/posts/#{post1.id}/reply", post: { title: "" }
    body.should include("#{post1.title}")
  end

  it "GET /posts/:id/edit" do
    login
    get "/posts/#{post1.id}/edit"
    body.should include("Edit:")
  end

  it "PUT /posts/:id" do
    login
    put "/posts/#{post1.id}", { post: { title: "asd" } }
    referer.should == "/posts/#{post1.id}"
    Post.get(post1.id).title.should == "asd"
  end

  context "post redirects to root" do
    it "PUT /posts/:id" do
      login
      post2 = user.reply post1, title: "lol", text: "lololol"
      post2.save
      put "/posts/#{post2.id}", { post: { title: "asd" } }
      referer.should == "/posts/#{post1.id}"
    end
  end

  after :all do
    clear_db
  end
end