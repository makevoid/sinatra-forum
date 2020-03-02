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
mysql_pass = ENV["MYSQL_PASSWORD"] || "antanisblinda"
mysql_auth = ""
mysql_auth = "root:#{mysql_pass}" if env != "test"
DataMapper.setup :default, "mysql://#{mysql_auth}@localhost/sinforum_#{env}"
require_all "#{path}/models"

require "#{path}/lib/ruby_exts.rb"
require "#{path}/config/sinatra_exts.rb"

DataMapper.finalize
