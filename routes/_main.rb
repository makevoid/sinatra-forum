class Sinforum < Sinatra::Base
  get "/" do
    haml :forums
  end

  get "/help" do
    haml :help
  end
end