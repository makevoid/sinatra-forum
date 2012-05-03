require "spec_helper"

describe Post do
  it "has a parent" do
    forum = Forum.create name: "foro"
    post1 = user.post forum, title: "one", text: "one"
    post1.save
    post2 = user.post forum, title: "two", text: "two", parent_id: post1.id
    post2.save

    post2.parent.should == post1
    post1.children.should == [post2]
  end

  it "updates forum.posts_count" do
    forum = Forum.create name: "foro"
    post = user.post forum, title: "one", text: "one"
    post.save
    Forum.get(forum.id).posts_count.should == 1
    post.destroy
    Forum.get(forum.id).posts_count.should == 0
  end

  it "updates last_post_id" do
    forum = Forum.create name: "foro"
    post = user.post forum, title: "one", text: "one"
    post.save
    forum.last_post_id.should == post.id
    post.destroy
    forum.last_post_id.should be_nil
  end
end