class User
  include DataMapper::Resource

  ROLES = [ :guest, :member, :admin ]

  property :id,         Serial
  property :username,   String, length: 100, required: true, unique: true
  property :role,       Enum[*ROLES], default: :guest
  property :password,   String, required: true, length: 5..50
  property :diablo_id,  String
  property :avatar,     String, length: 255
  property :signature,  Text

  has n, :posts

  default_scope(:default).update order: :id.desc

  ROLES.each do |role|
    define_method "#{role}?" do
      self.role == role
    end
  end

  # attributes

  DEFAULT_AVATAR = "/images/avatars/d3_1.jpg"

  def avatar_image
    "<img src='#{avatar.nilblank || DEFAULT_AVATAR}' class='avatar' />"
  end

  # filters

  def posts_roots
    posts.all(parent_id: nil)
  end

  def replies
    posts.all(:parent_id.not => nil)
  end

  def posts_lasts
    posts.all(limit: 20)
  end

  # actions

  def mine?(post)
    post.user == self
  end

  def post(forum, attributes)
    forum.posts.new attributes.merge(user_id: self.id)
  end

  def reply(post, attributes)
    post.forum.posts.new attributes.merge(user_id: self.id, parent_id: post.id)
  end

  # authentication

  require 'scrypt'

  attr_accessor :password_confirmation

  validates_confirmation_of :password

  before :create do
    SCrypt::Password.create("my grand secret")
    self.password = crypt_password self.password
  end

  def password?(pass)
    self.password == crypt_password(pass)
  end

  def crypt_password(pass)
    SCrypt::Password.create pass
  end

end
