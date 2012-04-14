path = File.expand_path '../', __FILE__

require "#{path}/config/env.rb"

class Sinforum < Sinatra::Base
  # sinatra configurations go here
end

require_all "#{path}/routes"