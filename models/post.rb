class Post
  include DataMapper::Resource

  property :id,       Serial
  property :title,    String,   length: 100, required: true
  property :text,     Text, required: true
  property :created_at, DateTime
  property :updated_at, DateTime

  belongs_to :forum
  belongs_to :user

  # parent

  property :parent_id, Integer

  def parent
    parent_id ? Post.get(parent_id) : self
  end
  alias :root? :parent

  def children
    Post.all parent_id: self.id
  end

  # timestamps at

  before :create do
    self.created_at = Time.now
  end

  before :save do
    self.updated_at = Time.now
  end

  after :save do
    forum.update updated_at: Time.now
  end

end