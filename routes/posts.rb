class Sinforum < Sinatra::Base
  get "/posts/:id" do |id|
    @post = Post.get id.to_i
    @forum = @post.forum
    haml :post
  end
end