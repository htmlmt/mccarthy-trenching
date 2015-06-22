class EmailProcessor
  def initialize(email)
    @email = email
  end

  def process
    
    Post.create!(
      headline: @email.subject,
      body: @email.text
    )
  end
end