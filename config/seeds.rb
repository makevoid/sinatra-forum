path = File.expand_path "../../", __FILE__

require "#{path}/config/env"

DataMapper.auto_migrate!

user = User.create username: "admin", password: "secret", password_confirmation: "secret"
forum = Forum.create name: "foro", description: "first forum"


post1 = user.post forum, title: "one", text: "one"
post1.save
post2 = user.post forum, title: "two", text: "two", parent_id: post1.id
post2.save


Icon.unpack