class User
  include DataMapper::Resource

  property :id,       Serial
  property :user,     String, length: 100
  property :pass,     String
  property :salt,     String
  property :avatar,   String, length: 255
  property :signature, Text

  has n, :posts

  def post(forum, attributes)
    forum.posts.create attributes.merge(user: self)
  end

  def reply(post, attributes)
    Post.create attributes.merge(user: self, parent_id: post.id, forum: post.forum)
  end

end