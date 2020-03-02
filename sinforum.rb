path = File.expand_path '../', __FILE__

require "#{path}/config/env.rb"

class Sinforum < Sinatra::Base
  @@path = File.expand_path '../', __FILE__

  set :root, @@path

  configure :development do
    before do
      unless defined?(@@session_set)
        @@session_set = true
        session[:user_id] = User.last && User.last.id
      end
    end

    require 'growl'
    Growl.notify 'Sinatra server loaded', icon: :Terminal, title: 'Loaded'
  end

  include Voidtools::Sinatra::ViewHelpers

  require "#{@@path}/lib/form_helpers"
  include FormHelpers
  require "#{@@path}/lib/markdown_helpers"
  require "#{@@path}/lib/icons_helpers"
  helpers do
    include MarkdownHelpers
    include IconsHelpers

    def markup(text)
      iconize markdown(text)
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

  def user_agent_class
    case request.user_agent
    when /firefox/i then "firefox"
    when /chrome/i  then "chrome"
    when /msie/i    then "ie"
    when /iphone/i  then "iphone"
    when /ipad/i    then "ipad"
    when /opera/i   then "opera"
    when /android/i then "android"
    when /safari/i  then "safari"
    end
  end
end

require_all "#{path}/routes"

LOAD_MODULES_ROUTES.call
