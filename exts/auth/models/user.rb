class User
  include DataMapper::Resource

  ROLES = [ :guest, :member, :admin ]


  property :id,         Serial
  property :username,   String, length: 100, required: true, unique: true
  property :role,       Enum[*ROLES], default: :guest
  property :password,   String, required: true, length: 5..50
  property :salt,       String
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

  def avatar_image
    default_avatar = "/images/avatars/d3_1.jpg"
    "<img src='#{avatar || default_avatar}' class='avatar' />"
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

  require 'digest/sha2'

  attr_accessor :password_confirmation

  validates_confirmation_of :password


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