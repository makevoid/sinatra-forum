path = File.expand_path '../', __FILE__

require "#{path}/sinforum"
use Rack::MethodOverride
run Sinforum