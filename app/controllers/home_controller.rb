class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  # GET /
  def index
    @posts = Post.page(params[:page]).includes(:user, :reviews).recent
    render 'posts/index'
  end
end
