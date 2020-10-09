class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  # GET /
  def index
    @posts = Post.includes(:user).recent.page(params[:page])
    render 'posts/index'
  end
end
