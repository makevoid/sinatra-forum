class Sinforum < Sinatra::Base
  get "/posts/:id" do |id|
    @post = Post.get id.to_i
    @forum = @post.forum
    @replies = @post.replies
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
    @post = current_user.post @forum, params[:post]
    @route = :new
    if @post.save
      redirect "/forums/#{@forum.id}"
    else
      haml :_post_form
    end
  end

  post "/posts/:post_id/reply" do |post_id|
    login_required
    post = Post.get post_id
    @post = current_user.reply post, params[:post]
    if @post.save
      redirect "/posts/#{post.id}"
    else
      @forum = post.forum
      @replies = @post.replies
      haml :post
    end
  end
end