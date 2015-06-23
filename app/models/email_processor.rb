class EmailProcessor
  def initialize(email)
    @email = email
  end

  def process
    if @email.to == "lastnews@mctrenching.com"
      @post = Post.last
      @post.update(
        headline: @email.subject,
        body: @email.body
      )
    elsif @email.to == "lastshow@mctrenching.com"
      @show = Show.last
      @show.update(
        date: DateTime.parse(@email.subject),
        description: @email.raw_body
      )
    elsif @email.to == "news@mctrenching.com"
      Post.create!(
        headline: @email.subject,
        body: @email.body
      )
    elsif @email.to == "shows@mctrenching.com"
      Show.create!(
        date: DateTime.parse(@email.subject),
        description: @email.raw_body
      )
    else
      
    end
  end
end