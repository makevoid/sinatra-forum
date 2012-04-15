path = File.expand_path "../../", __FILE__

require "#{path}/config/env"

DataMapper.auto_migrate!

forum = Forum.create name: "foro"
post1 = forum.posts.create name: "one"
post2 = forum.posts.create name: "two", parent_id: post1.id