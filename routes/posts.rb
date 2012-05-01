class Sinforum < Sinatra::Base
  get "/posts/:id" do |id|
    @post = Post.get id.to_i
    @forum = @post.forum
    haml :post
  end

  get "/forums/:forum_id/posts/new" do |forum_id|
    @forum = Forum.get forum_id
    haml :_post_form
  end
end