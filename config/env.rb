path = File.expand_path '../', __FILE__
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

# DataMapper.setup :default, "mysql://root@localhost:sinforum_development"
require_all "#{path}/models"
# DataMapper.finalize