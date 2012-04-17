path = File.expand_path "../../", __FILE__

ENV["RACK_ENV"] = "test"
require "#{path}/config/env"
DataMapper.auto_migrate!



def clear_db
  DataMapper.auto_migrate!
end

def user
  @@user ||= User.create username: "antani", password: "sblinda", password_confirmation: "sblinda"
end