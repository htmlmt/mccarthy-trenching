class EmailProcessor
  def initialize(email)
    @email = email
  end

  def process(email)
    @email = email
    Post.create!(
      headline: @email.subject,
      body: @email.body
    )
  end
end