path = File.expand_path "../../", __FILE__

require "#{path}/config/env"

DataMapper.auto_migrate!

user = User.create user: "antani"
forum = Forum.create name: "foro"

post1 = user.post forum, title: "one", text: "one"
post2 = user.post forum, title: "two", text: "two", parent_id: post1.id