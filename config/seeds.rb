path = File.expand_path "../../", __FILE__

require "#{path}/config/env"

DataMapper.auto_migrate!

admin = User.create username: "admin", password: "secret", password_confirmation: "secret", role: :admin
member = User.create username: "member", password: "secret", password_confirmation: "secret", role: :member
guest = User.create username: "member", password: "secret", password_confirmation: "secret", role: :guest
forum1 = Forum.create name: "foro", description: "first forum"
forum2 = Forum.create name: "secreto", description: "il mio tessssooooro", private: true


post1 = member.post forum1, title: "one", text: "one"
post1.save
reply = guest.reply post1, title: "two", text: "two"
reply.save


Icon.unpack