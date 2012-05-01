path = File.expand_path "../../", __FILE__

ENV["RACK_ENV"] = "test"
require "#{path}/config/env"


def clear_db
  DataMapper.auto_migrate!
end

def user
  @@user ||= User.create username: "antani3", password: "sblinda", password_confirmation: "sblinda"
end

def factory(type)
  case type.name
  when "User"
    User.create username: "antani#{rand(100000)}", password: "sblinda", password_confirmation: "sblinda"
  else
    raise "factory type not handled: #{type}"
  end
end

class SessionData
  def initialize(cookies)
    @cookies = cookies
    @data = cookies['rack.session']
    if @data
      @data = @data.unpack("m*").first
      @data = Marshal.load(@data)
    else
      @data = {}
    end
  end

  def [](key)
    @data[key]
  end

  def []=(key, value)
    @data[key] = value
    session_data = Marshal.dump(@data)
    session_data = [session_data].pack("m*")
    @cookies.merge("rack.session=#{Rack::Utils.escape(session_data)}", URI.parse("//example.org//"))
    raise "session variable not set" unless @cookies['rack.session'] == session_data
  end
end

def session
  SessionData.new(rack_test_session.instance_variable_get(:@rack_mock_session).cookie_jar)
end

clear_db