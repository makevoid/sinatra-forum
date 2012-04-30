class Sinforum < Sinatra::Base

  def current_user
    @current_user ||= User.get session[:user_id]
  end

  def logged_in?
    current_user
  end

  def admin?
    current_user && true # current_user.admin?
  end

  get "/login" do
    haml_mod :login
  end

  post "/sessions" do
    @user = User.first(username: params[:user][:username]) if params[:user]
    if @user && @user.password?(params[:user][:password])
      flash[:notice] = "Logged in!"
      session[:user_id] = @user.id
      redirect "/"
    else
      flash[:alert] = "Invalid username or password."
      haml_mod :login
    end
  end

  post "/logout" do
    session[:user_id] = nil
    redirect "/"
  end
end