class User
  include DataMapper::Resource

  property :id,       Serial
  property :name,     String
  property :avatar,   String,   length: 255
  property :signature, Text

end