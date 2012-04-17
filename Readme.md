# SinForum
### simple forum build on sinatra

### Installation

- download / clone the project and cd into the directory
- create a mysql database named sinforum_development

example:

    mysql -u root -e "CREATE DATABASE sinforum_development;"

- install dependencies

    bundle

- automigrate and apply seeds

    ruby config/seeds.rb

- run rack server

example:

    rackup


### Testing

create database

    mysql -u root -e "CREATE DATABASE sinforum_test;"

run migrations

    RACK_ENV=test ruby -e 'DataMapper.auto_migrate!' -r ./config/env

run specs

    rspec