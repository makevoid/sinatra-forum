class Sinforum < Sinatra::Base
  get "/posts/:id" do |id|
    @post = Post.get id.to_i
    @forum = @post.forum
    haml :post
  end

  get "/forums/:forum_id/posts/new" do |forum_id|
    @forum = Forum.get forum_id
    @post = @forum.posts.new params[:post]
    haml :_post_form
  end

  post "/forums/:forum_id/posts" do |forum_id|
    login_required
    @forum = Forum.get forum_id
    @post = @forum.posts.new params[:post]
    @post.user_id = current_user.id
    @route = :new
    if @post.save
      redirect "/forums/#{@forum.id}"
    else
      haml :_post_form
    end
  end
end