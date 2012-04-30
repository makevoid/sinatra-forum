path = File.expand_path '../', __FILE__

require "#{path}/config/env.rb"

class Sinforum < Sinatra::Base
  @@path = File.expand_path '../', __FILE__

  set :root, @@path
  enable :sessions

  configure :development do
    use Rack::Reloader, 0
    Sinatra::Application.reset!
  end

  include Voidtools::Sinatra::ViewHelpers

  require "#{@@path}/lib/form_helpers"
  include FormHelpers

  # partials

  # partial :comment, { comment: "blah" }
  # partial :comment, comment

  def extract_locals(name, value)
    if value.is_a? Hash
      value
    else
      hash = {}; hash[name] = value
      hash
    end
  end

  def partial(name, value={})
    haml "_#{name}".to_sym, locals: extract_locals(name, value)
  end

  # flash messages

  def flash
    @@flashes ||= {}
  end

  after do
    @@flashes = {}
  end
end

require_all "#{path}/routes"

LOAD_MODULES_ROUTES.call