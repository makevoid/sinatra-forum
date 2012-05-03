require "spec_helper"

describe Forum do

  it "last post" do
    forum = Forum.create name: "antani"
    post = user.post forum, title: "one", text: "one"
    post.save
    Forum.get(forum.id).last_post.should == post
  end

end