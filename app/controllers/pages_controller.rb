class PagesController < ApplicationController
  def index
    @posts = Post.order(created_at: :desc)
    @shows = Show.all
  end
end