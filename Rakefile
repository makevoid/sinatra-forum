desc "Run"
task :run do
  sh "bundle exec rackup -p 3000 -o 0.0.0.0"
end

desc "Automigrate and Seed the DB" # (auto-migrate is create tables if no data is present - DataMapper terminology/flows)
task :seeds do
  sh "bundle exec ruby config/seeds.rb"
end

task default: :run
