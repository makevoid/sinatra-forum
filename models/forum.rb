class Forum
  include DataMapper::Resource

  property :id,       Serial
  property :name,     String
  property :private,  Integer, default: 0
  property :updated_at, DateTime

  has n, :posts

  before :create do
    self.updated_at = Time.now
  end

end