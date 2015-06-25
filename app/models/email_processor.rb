class EmailProcessor
  def initialize(email)
    @email = email
  end

  def process
    to_address = @email.to[0][:email]
    content = @email.raw_html
    if to_address == "lastnews@mctrenching.com"
      @post = Post.last
      @post.update(
        headline: @email.subject,
        body: content
      )
    elsif to_address == "lastshow@mctrenching.com"
      @show = Show.last
      @show.update(
        date: DateTime.parse(@email.subject),
        description: content
      )
    elsif to_address == "news@mctrenching.com"
      Post.create!(
        headline: @email.subject,
        body: content
      )
    elsif to_address == "shows@mctrenching.com"
      Show.create!(
        date: DateTime.parse(@email.subject),
        description: content
      )
    else
      
    end
  end
end