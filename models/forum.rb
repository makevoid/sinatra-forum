class Forum
  include DataMapper::Resource

  property :id,           Serial
  property :name,         String,   required: true
  property :description,  String
  property :private,      Boolean,  default: false
  property :updated_at,   DateTime, default: Time.now
  property :posts_count,  Integer,  default: 0
  property :last_post_id, Integer

  def self.privates
    all(private: true)
  end

  def self.publics
    all(private: false)
  end

  def last_post
    @last_post ||= Post.get last_post_id
  end

  def empty?
    last_post.nil?
  end

  def public?
    !private?
  end

  has n, :posts

  before :create do
    self.updated_at = Time.now
  end

end