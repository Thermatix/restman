
=begin
class Post
  include DataMapper::Resource

  property :id,         Serial    # An auto-increment integer key
  property :title,      String    # A varchar type string, for short strings
  property :body,       Text      # A text block, for longer string data.
  property :created_at, DateTime  # A DateTime, for any date you might like.
end

Post.auto_migrate!
first_post = Post.new
first_post.title = "First!"
first_post.save

get "/" do
  Post.get(1).title
end
=end