class Sinforum < Sinatra::Base
  get "/forums" do
    haml :forums
  end

  get "/forums/:id" do |id|
    @forum = Forum.get id
    haml :forum
  end
end