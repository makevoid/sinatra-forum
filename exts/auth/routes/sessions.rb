class Sinforum < Sinatra::Base
  get "/login" do
    haml_mod :login
  end

  post "/login" do

  end

  post "/logout" do

  end
end