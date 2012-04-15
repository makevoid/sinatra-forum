class Forum
  include DataMapper::Resource

  property :id,       Serial
  property :name,     String
  property :private,  Integer, default: 0

  has n, :posts

end