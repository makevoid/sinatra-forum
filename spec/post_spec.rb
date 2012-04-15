require "spec_helper"

describe "Post" do
  it "has a parent" do
    forum = Forum.create name: "foro"
    post1 = forum.posts.create name: "one"
    post2 = forum.posts.create name: "two", parent_id: post1.id

    post2.parent.should == post1
    post1.children.should == [post2]
  end
end