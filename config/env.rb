path = File.expand_path '../../', __FILE__
APP = "sinforum"

require "bundler/setup"
Bundler.require :default
module Utils
  def require_all(path)
    Dir.glob("#{path}/**/*.rb") do |model|
      require model
    end
  end
end
include Utils

env = ENV["RACK_ENV"] || "development"
DataMapper.setup :default, "mysql://#{"root@#{File.read("/Users/makevoid/.password").strip}" if env == "production"}localhost/sinforum_#{env}"
require_all "#{path}/models"

require "#{path}/lib/ruby_exts.rb"
require "#{path}/config/sinatra_exts.rb"

DataMapper.finalize