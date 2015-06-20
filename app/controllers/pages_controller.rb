class PagesController < ApplicationController
  def index
    @posts = Post.all
    @shows = Show.all
  end
end