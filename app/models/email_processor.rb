class EmailProcessor
  def initialize(email)
    @email = email
  end

  def process
    if @email.to[:email] == "lastnews@mctrenching.com"
      @post = Post.last
      @post.update(
        headline: @email.subject,
        body: @email.body
      )
    elsif @email.to[:email] == "lastshow@mctrenching.com"
      @show = Show.last
      @show.update(
        date: DateTime.parse(@email.subject),
        description: @email.raw_body
      )
    elsif @email.to[:email] == "news@mctrenching.com"
      Post.create!(
        headline: @email.subject,
        body: @email.body
      )
    elsif @email.to[:email] == "shows@mctrenching.com"
      Show.create!(
        date: DateTime.parse(@email.subject),
        description: @email.raw_body
      )
    else
      
    end
  end
end