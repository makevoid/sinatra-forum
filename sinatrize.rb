# Sinatrize

# usage:
#
# mkdir -p yourapp
# cd yourapp
# wget https://raw.github.com/gist/2385559/sinatrize.rb
# ruby sinatrize.rb


module Capitalize
  def capitalize
    str = self.class? String ? self : self.to_s
    str[0].upcase + str[1..-1]
  end
end

class Pathname
  include Capitalize
end

class String
  include Capitalize
end

## environment

path = File.expand_path ".", __FILE__
require 'pathname'
dirname = Pathname.new(path).dirname.basename
app_name = dirname.to_s
# puts app_name

## configs

dirs = ["config", "views", "public", "routes", "sass", "public/css"]

files = [
  { path: "Gemfile",
    contents: <<-CONT
source :rubygems

gem "sinatra"
gem "json"

# gem "dm-core"
# gem "dm-mysql-adapter"
# gem "dm-migrations"

gem "haml"
gem "sass"
CONT
  },
  { path: "config.ru",
    contents: <<-CONT
path = File.expand_path '../', __FILE__

require "\#{path}/#{app_name}"
run #{app_name.capitalize}
CONT
  },
  { path: "#{app_name}.rb",
    contents: <<-CONT
path = File.expand_path '../', __FILE__

require "\#{path}/config/env.rb"

class #{app_name.capitalize} < Sinatra::Base
  # sinatra configurations go here
end

require_all "\#{path}/routes"
CONT
  },
  { path: "config/env.rb",
    contents: <<-CONT
path = File.expand_path '../', __FILE__
APP = "#{app_name}"

require "bundler/setup"
Bundler.require :default
module Utils
  def require_all(path)
    Dir.glob("\#{path}/**/*.rb") do |model|
      require model
    end
  end
end
include Utils

# DataMapper.setup :default, "mysql://root@localhost:#{app_name}_development"
require_all "\#{path}/models"
# DataMapper.finalize

CONT
  },
  { path: "routes/_main.rb",
    contents: <<-CONT
class #{app_name.capitalize} < Sinatra::Base
  get "/" do
    haml :index
  end
end
CONT
  },
  { path: "views/index.haml",
    contents: <<-CONT
Hello world!
CONT
  },
  { path: "views/layout.haml",
    contents: <<-CONT
%html
  %head
    %title= #{app_name.capitalize}
    %link{ rel: "stylesheet", href: "/css/main.css" }
  %body
    #container
      %header
        %h1 #{app_name.capitalize}
      %nav
      %section.content= yield
CONT
  },
  { path: "Guardfile",
    contents: <<-CONT
guard 'sass', :input => 'sass', :output => 'public/css'
CONT
  },
  { path: "sass/main.sass",
    contents: <<-CONT
body
  background: #EEE
CONT
  },
]

## code

def create_directories(dirs)
  dirs.each do |dir|
    `mkdir -p #{dir}`
  end
end

create_directories dirs

files.each{ |file| file[:contents].strip! }

files.each do |file|
  File.open(file[:path], "w") do |f|
    f.write file[:contents]
  end
end