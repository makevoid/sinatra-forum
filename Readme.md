# SinForum
### simple forum build on sinatra

Example of a Diablo III styled forum: http://bitclan.it (branch bit)

### Features:

- Very Simple and Straightforward
- Easyly Stylable (SASS + CSS3)
- Very fast! (sinatra with few libraries)
- Robust (good spec coverage, important stuff covered, with RSpec)
- DataMapper ORM
- Markdown support
- github icons support
- avatars
- private forums
- more to come...

try it and send feedback to [@makevoid](http://francescocanessa.com)


### Installation

- download / clone the project and cd into the directory
- create a mysql database named sinforum_development

example:

    mysql -u root -e "CREATE DATABASE sinforum_development;"

- install dependencies

    bundle --without test

- automigrate and apply seeds (includes icon files unpacking)

    ruby config/seeds.rb

- run rack server

example:

    rackup


### Development mode

note: in development mode the first user (admin) gets logged in by default to ease the development

    foreman start

and you are good to go!


### Testing

create database

    mysql -u root -e "CREATE DATABASE sinforum_test;"

run auto migrate

    RACK_ENV=test ruby -e 'DataMapper.auto_migrate!' -r ./config/env

run specs

    rspec