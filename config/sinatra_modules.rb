path = File.expand_path "../../", __FILE__

mod = "auth"

if defined?(DataMapper)
  require_all "#{path}/modules/#{mod}/models"
end

LOAD_MODULES_ROUTES = lambda do
  class Sinforum < Sinatra::Base
    @@mod = "auth"

    def haml_mod(view, options={})
      haml "../modules/#{@@mod}/views/#{view}".to_sym, options
    end
  end

  require_all "#{path}/modules/#{mod}/routes"
end

