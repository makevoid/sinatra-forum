# sinatra-forum
### simple forum build on sinatra (2012)

- status: dep update needed 
- works only on ruby 2.1?


[![Build Status](https://secure.travis-ci.org/makevoid/sinforum.png?branch=master)](https://travis-ci.org/makevoid/sinforum)

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
- extract the zip file containing the icons `cd public/images/icons/; tar xfz icons.tgz`

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

    foreman start

and you are good to go!


### Testing

create database

    mysql -u root -e "CREATE DATABASE sinforum_test;"

extract the zip file containing the icons (if you didn't di it already)

    cd public/images/icons/; tar xfz icons.tgz

run specs

    rspec
    
    
    
### Todo

- Email notifications on replies and button to opt-in opt/out from the topic
