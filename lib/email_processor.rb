class EmailProcessor
  def initialize(email)
    @email = email
  end

  def process
    # all of your application-specific code here - creating models,
    # processing reports, etc

    # here's an example of model creation
    Post.create!(
      headline: @email.subject,
      body: @email.text
    )
  end
end