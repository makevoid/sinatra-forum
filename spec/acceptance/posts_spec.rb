require_relative "spec_helper"

describe "Posts" do
  let(:forum){ Forum.create name: "foro"  }
  let(:post){ forum.posts.create title: "one", text: "one", user_id: user.id  }

  it "GET /posts/:id" do
    get "/posts/#{post.id}"
    body.should include(post.title)
  end

  after :all do
    clear_db
  end
end