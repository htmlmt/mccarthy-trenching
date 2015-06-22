def initialize(email)
  @email = email
end

def process
  Post.create!({ headline: @email.subject, body: @email.body })
end