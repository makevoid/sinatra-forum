path = File.expand_path "../../../", __FILE__
require "spec_helper"

require 'rack/test'

# Bundler.require :acceptance_test
# require 'capybara/rspec'
# Capybara.javascript_driver = :webkit

def app
  Sinforum
end
include Rack::Test::Methods

enable :sessions


require "#{path}/sinforum"
# Capybara.app = app


DataMapper.auto_migrate!

def body
  last_response.body
end

def referer
  location = last_response.headers["Location"]
  location.gsub(/http:\/\/example\.org/, '') if location
end

def clear_db
  DataMapper.auto_migrate!
end

def login(user)
  session[:user_id] = user.id
end

def sinforum_login
  visit "/"
  raise "implement me"
end

def user
  @user ||= User.create username: "antani", password: "sblinda", password_confirmation: "sblinda"
end

def app.current_user
  $spec_current_user
end

def login
  $spec_current_user = User.first
end

def clear_login
  $spec_current_user = nil
end