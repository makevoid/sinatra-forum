# SinForum
### simple forum build on sinatra

### Installation

- download / clone the project and cd into the directory
- create a mysql database named sinforum_development

example:

    mysql -u root -e "CREATE DATABASE sinforum_development;"

- install dependencies

    bundle

- automigrate and apply seeds (includes icon files unpacking)

    ruby config/seeds.rb

- run rack server

example:

    rackup


### Development mode

note: in development mode the first user (admin) gets logged in by default to ease the development


### Testing

create database

    mysql -u root -e "CREATE DATABASE sinforum_test;"

run auto migrate

    RACK_ENV=test ruby -e 'DataMapper.auto_migrate!' -r ./config/env

run specs

    rspec