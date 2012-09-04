source :rubygems

gem "sinatra"
gem "json"

gem "dm-core"
if RUBY_PLATFORM =~ /win32|mingw/
  gem "dm-sqlite-adapter"
else
  gem "dm-mysql-adapter"
end
gem "dm-migrations"
gem "dm-validations"
gem "dm-types"

gem "haml"
gem "sass"
gem "rdiscount"

gem "voidtools"

if RUBY_PLATFORM =~ /win32/
  gem "ffi", "= 1.0.9"
end

group :test do
  gem "rspec-core"
  gem "rspec-mocks"
  gem "rspec-expectations"

  gem "rack-test"
end

group :development do
  gem "capistrano"
  gem "foreman"
  gem "rerun"
  gem "guard"
  gem "guard-sass"
  gem "guard-coffeescript"
  gem "guard-livereload"
  gem 'growl'
end
# group :acceptance_test do
#   gem "capybara"
# end