class EmailProcessor
  def self.process(email)
    Post.create!({ body: email.body, headline: email.subject })
  end
end