class Sinforum < Sinatra::Base

  get "/users" do
    haml_mod :users
  end

  get "/register" do
     haml :register
  end

  post "/users" do
    User.create params[:user]
    redirect "/"
  end

end