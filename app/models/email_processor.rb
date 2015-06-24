class EmailProcessor
  def initialize(email)
    @email = email
  end

  def process
    to_address = @email.to[0][:email]
    if to_address == "lastnews@mctrenching.com"
      @post = Post.last
      @post.update(
        headline: @email.subject,
        body: @email.raw_text
      )
    elsif to_address == "lastshow@mctrenching.com"
      @show = Show.last
      @show.update(
        date: DateTime.parse(@email.subject),
        description: @email.raw_text
      )
    elsif to_address == "news@mctrenching.com"
      Post.create!(
        headline: @email.subject,
        body: @email.raw_text
      )
    elsif to_address == "shows@mctrenching.com"
      Show.create!(
        date: DateTime.parse(@email.subject),
        description: @email.raw_text
      )
    else
      
    end
  end
end