class Sinforum < Sinatra::Base

  get "/users" do
    @users = User.all
    haml_mod :users
  end

  get "/users/:id" do |id|
    p id
    @user = User.get id
    haml_mod :user
  end

  get "/register" do
    @user = User.new
    haml_mod :register
  end

  post "/users" do
    @user = User.new params[:user]
    if @user.save
      redirect "/"
    else
      haml_mod :register
    end
  end

end