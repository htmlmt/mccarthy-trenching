class EmailProcessor
  def self.process(email)
    @post = Post.new(body: email.body, headline: email.subject)
    @post.save
  end
end