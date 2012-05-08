path = File.expand_path '../', __FILE__

require "#{path}/config/env.rb"

class Sinforum < Sinatra::Base
  @@path = File.expand_path '../', __FILE__

  set :root, @@path

  configure :development do
    before do
      unless defined?(@@session_set)
        @@session_set = true
        session[:user_id] = User.first.id
      end
    end

    require 'growl'
    Growl.notify 'Sinatra server loaded', icon: :Terminal, title: 'Loaded'
  end

  include Voidtools::Sinatra::ViewHelpers

  require "#{@@path}/lib/form_helpers"
  include FormHelpers
  require "#{@@path}/lib/markdown_helpers"
  helpers do
    include MarkdownHelpers
    require "rdiscount"
    def markdown(string)
      RDiscount.new(string).to_html
    end

  end
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

  # utils

  def route_is_new?(options={})
    num_split = options[:nested] ? 4 : 2
    request.path.split("/")[num_split] == "new" || @route == :new
  end

end

require_all "#{path}/routes"

LOAD_MODULES_ROUTES.call