class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  # GET /posts
  def index
    @posts = Post.includes(:user).recent.page(params[:page])
  end

  # POST /posts
  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to @post, notice: '投稿しました。'
    else
      render new_post_path
    end
  end

  # GET /posts/new
  def new
    @post = current_user.posts.new
  end

  # GET /posts/:id
  def show
    @post = Post.find(params[:id])
    @post_reviews = @post.reviews.order_by_number_of_likes.preload(:user, :likes, comments: :user)
    return unless user_signed_in?

    @post_review = current_user.post_reviews.new if @post.user != current_user
    @post_review_comments = current_user.post_review_comments.new
  end

  # DELETE /posts/:id
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
