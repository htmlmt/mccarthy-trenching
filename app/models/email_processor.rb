class EmailProcessor
  def initialize(email)
    @email = email
  end

  def process
    if @email.to[:email] == "editlast@mctrenching.com"
      @post = Post.last
      @post.update(
        headline: @email.subject,
        body: @email.body
      )
    else
      Post.create!(
        headline: @email.subject,
        body: @email.body
      )
    end
  end
end