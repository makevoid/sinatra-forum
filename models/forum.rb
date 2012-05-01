class Forum
  include DataMapper::Resource

  property :id,           Serial
  property :name,         String, required: true
  property :description,  String
  property :private,      Integer, default: 0
  property :updated_at,   DateTime, default: Time.now

  has n, :posts

  before :create do
    self.updated_at = Time.now
  end

end