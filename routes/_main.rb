class Sinforum < Sinatra::Base
  get "/" do
    haml :index
  end
end