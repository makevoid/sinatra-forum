class User
  include DataMapper::Resource

  property :id,         Serial
  property :username,   String, length: 100, required: true, unique: true
  property :password,   String, required: true, length: 5..50
  property :salt,       String
  property :avatar,     String, length: 255
  property :signature,  Text

  has n, :posts

  # actions

  def post(forum, attributes)
    forum.posts.create attributes.merge(user: self)
  end

  def reply(post, attributes)
    Post.create attributes.merge(user: self, parent_id: post.id, forum: post.forum)
  end

  # authentication

  require 'digest/sha2'

  attr_accessor :password_confirmation

  validates_with_block :password_confirmation do
    self.password_confirmation == self.password ? [true] : [false,  "Password and Confirmed password have different values."]
  end

  before :create do
    generate_salt
    self.password = crypt_password self.password
  end

  def password?(pass)
    self.password == crypt_password(pass)
  end

  def crypt_password(pass)
    hexdigest "#{self.salt}comesefosse#{pass}"
  end

  def generate_salt
    self.salt = hexdigest "#{Time.now}sblinda"
  end

  def hexdigest(string)
    Digest::SHA2.hexdigest(string)[0..49]
  end

end