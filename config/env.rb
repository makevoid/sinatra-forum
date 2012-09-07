path = File.expand_path '../../', __FILE__
APP = "sinforum"

windows_dev_only = RUBY_PLATFORM =~ /win32|mingw/
bundler_require = !windows_dev_only
bundler_require = true

require "bundler/setup"
if bundler_require
  Bundler.require :default
else
  puts "loading dev gems without bundler..."
  File.open("#{path}/Gemfile").each_line do |line|
    gem_match = line.match /^\s*gem\s*["']([-\w]+)["']/
    if gem_match
      break if gem_match[1] =~ /rspec/
      next if gem_match[1] =~ /dm-mysql-adapter/
      require gem_match[1]
    end
  end
end

module Utils
  def require_all(path)
    Dir.glob("#{path}/**/*.rb") do |model|
      require model
    end
  end
end
include Utils

env = ENV["RACK_ENV"] || "development"

if RUBY_PLATFORM =~ /win32|mingw/
  DataMapper.setup :default, "sqlite://#{path}/config/sinforum_db.sqlite"
else
  DataMapper.setup :default, "mysql://127.0.0.1/sinforum_#{env}"
end

require_all "#{path}/models"

require "#{path}/lib/ruby_exts.rb"
require "#{path}/config/sinatra_exts.rb"

DataMapper.finalize
