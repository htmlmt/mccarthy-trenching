class EmailProcessor
  def self.process(email)
    binding.remote_pry
    binding.pry
    Post.create!({ body: email.body, headline: email.subject })
  end
end