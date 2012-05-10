class Sinforum < Sinatra::Base
  get "/" do
    @forums = member? ? Forum.all : Forum.publics
    haml :forums
  end

  get "/help" do
    haml :help
  end
end