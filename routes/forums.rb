class Sinforum < Sinatra::Base

  get "/forums" do
    @forums = member? ? Forum.all : Forum.publics
    haml :forums
  end

  get "/forums/new" do
    admin_required
    @forum = Forum.new params[:forum]
    haml :_forum_form
  end

  get "/forums/:id" do |id|
    @forum = Forum.get id
    @posts = @forum.posts.all(parent_id: nil)
    haml :forum
  end

  get "/forums/:id/edit" do |id|
    admin_required
    @forum = Forum.get id
    haml :_forum_form
  end

  post "/forums" do
    admin_required
    @forum = Forum.new params[:forum]
    if @forum.save
      redirect "/"
    else
      @route = :new
      haml :_forum_form
    end
  end

  put "/forums/:id" do |id|
    admin_required
    @forum = Forum.get id
    if @forum.update params[:forum]
      redirect "/forums/#{@forum.id}"
    else
      @route = :edit
      haml :_forum_form
    end
  end

end