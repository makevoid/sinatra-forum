class Sinforum < Sinatra::Base

  get "/users" do
    haml_mod :users
  end

  get "/register" do
    @user = User.new
    haml :register
  end

  post "/users" do
    @user = User.create params[:user]
    p @user.errors
    if @user.errors
      redirect "/"
    else
      haml :register
    end
  end

end