class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to @post, notice: '投稿しました。'
    else
      render :new
    end
  end

  def destroy
    post = current_user.posts.find(params[:id])
    if post.destroy
      redirect_to posts_path, notice: '投稿を削除しました。'
    else
      redirect_back fallback_location: posts_path, alert: '投稿の削除に失敗しました。'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
