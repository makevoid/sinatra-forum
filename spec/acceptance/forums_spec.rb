require_relative "spec_helper"

describe "Forum" do
  let(:forum){ Forum.create name: "foro"  }
  let(:post1){ forum.posts.create title: "one", text: "one", user_id: user.id  }
  let(:forum_pvt){ Forum.create name: "secreeto", private: true }

  before :all do
    forum
  end

  it "GET /forums" do
    get "/forums"
    body.should include(forum.name)
  end

  it "GET /forums - doesn't list private posts" do
    get "/forums"
    body.should_not include(forum_pvt.name)
  end

  it "GET /forums/:id" do
    get "/forums/#{forum.id}"
    body.should include(forum.name)
  end

  context "as admin" do

    before do
      login as_admin
    end

    it "GET /forums/new" do
      get "/forums/new"
      body.should include("New Forum")
    end

    it "GET /forums/:id/edit" do
      get "/forums/#{forum.id}/edit"
      body.should include("Edit:")
      body.should include(forum.name)
    end

    it "POST /forums" do
      forums = Forum.count
      post "/forums", forum: { name: "bitrox" }
      referer.should == "/"
      Forum.count.should == forums+1
    end

    it "POST /forums invalid" do
      forums = Forum.count
      post "/forums", forum: { name: "" }
      body.should include("New Forum")
    end

    it "PUT /forums/:id" do
      put "/forums/#{forum.id}", forum: { name: "bla" }
      Forum.get(forum.id).name.should == "bla"
      referer.should == "/forums/#{forum.id}"
    end

    it "PUT /forums/:id invalid" do
      put "/forums/#{forum.id}", forum: { name: "" }
      body.should include("Edit:")
    end

  end

  after :all do
    clear_db
  end

end