def initialize(email)
  @email = email
  binding.remote_pry
end

def process
  binding.remote_pry
  Post.create!(
    headline: @email.subject,
    body: @email.body
  )
end