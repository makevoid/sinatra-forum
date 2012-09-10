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


### Layouts:

- current default (default style)

![](http://uploads.makevoid.com/sinforum_layout_default.png)

![](http://uploads.makevoid.com/sinforum_post_view.png)


- current default (diablo3 style) [bit branch]

![](http://uploads.makevoid.com/bitforum_layout.png)

- future default [default_layout branch]

![](http://behance.vo.llnwd.net/profiles6/876337/projects/5076079/f6c6ff9d0815e62aad366193025be4b6.jpg)

made by @saver1991 

[full article on behance](http://www.behance.net/gallery/Sinforum-Template-Redesign/5076079)

suggestions for layout names are well accepted :)


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

    foreman start

and you are good to go!


### Testing

create database

    mysql -u root -e "CREATE DATABASE sinforum_test;"

run auto migrate

    RACK_ENV=test ruby -e 'DataMapper.auto_migrate!' -r ./config/env

run specs

    rspec