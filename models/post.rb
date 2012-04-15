class Post
  include DataMapper::Resource

  property :id,       Serial
  property :name,     String,   length: 100
  property :text,     Text

  property :parent_id, Integer

  def parent
    parent_id ? Post.get(parent_id) : self
  end
  alias :root? :parent

  def children
    Post.all parent_id: self.id
  end
end