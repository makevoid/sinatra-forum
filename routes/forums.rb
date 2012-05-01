class Sinforum < Sinatra::Base

  get "/forums" do
    haml :forums
  end

  get "/forums/new" do
    @forum = Forum.new params[:forum]
    haml :_forum_form
  end

  get "/forums/:id" do |id|
    @forum = Forum.get id
    haml :forum
  end

  get "/forums/:id/edit" do |id|
    @forum = Forum.get id
    haml :_forum_form
  end

  post "/forums" do
    @forum = Forum.new params[:forum]
    if @forum.save
      redirect "/"
    else
      @route = :new
      haml :_forum_form
    end
  end

  put "/forums/:id" do |id|
    @forum = Forum.get id
    if @forum.update params[:forum]
      redirect "/forums/#{@forum.id}"
    else
      @route = :edit
      haml :_forum_form
    end
  end
end