class Sinforum < Sinatra::Base

  get "/users" do
    haml_mod :users
  end

  get "/register" do
     haml :register
  end

end