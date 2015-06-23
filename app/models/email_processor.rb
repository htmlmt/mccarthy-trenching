class EmailProcessor
  def initialize(email)
    @email = email
  end

  def process
    Post.create!(
      headline: @email.to[0][:email]
    )
    if @email.to[0][:email] == "lastnews@mctrenching.com"
      @post = Post.last
      @post.update(
        headline: @email.subject,
        body: @email.body
      )
    elsif @email.to[0][:email] == "lastshow@mctrenching.com"
      @show = Show.last
      @show.update(
        date: DateTime.parse(@email.subject),
        description: @email.raw_body
      )
    elsif @email.to[0][:email] == "news@mctrenching.com"
      Post.create!(
        headline: @email.subject,
        body: @email.body
      )
    elsif @email.to[0][:email] == "shows@mctrenching.com"
      Show.create!(
        date: DateTime.parse(@email.subject),
        description: @email.raw_body
      )
    else
      
    end
  end
end