path = File.expand_path "../../", __FILE__

ENV["RACK_ENV"] = "test"
require "#{path}/config/env"


def clear_db
  DataMapper.auto_migrate!
end

def user
  @@user ||= User.create username: "antani3", password: "sblinda", password_confirmation: "sblinda"
end

def factory(type)
  case type.name
  when "User"
    User.create username: "antani#{rand(100000)}", password: "sblinda", password_confirmation: "sblinda"
  else
    raise "factory type not handled: #{type}"
  end
end

clear_db