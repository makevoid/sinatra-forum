class Sinforum < Sinatra::Base
  get "/" do
    haml :forums
  end
end