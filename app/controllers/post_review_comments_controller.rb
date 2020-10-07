class PostReviewCommentsController < ApplicationController
  # GET /posts/:post_id/post_reviews/:post_review_id/post_review_comments
  def index
    redirect_to post_path(params[:post_id])
  end

  # POST /posts/:post_id/post_reviews/:post_review_id/post_review_comments
  def create
    @post_review_comments = current_user.post_review_comments.new(post_review_comments_params)

    if @post_review_comments.save
      redirect_to post_path(params[:post_id])
    else
      @post = Post.find(params[:post_id])
      @post_reviews = @post.reviews.order_by_number_of_likes.preload(:user, :likes)
      @has_current_post = @post.user == current_user
      @post_review = current_user.post_reviews.new
      render 'posts/show'
    end
  end

  # DELETE /posts/:post_id/post_reviews/:post_review_id/post_review_comments/:id
  def destroy
    post_review_comments = current_user.post_review_comments.find(params[:id])
    post_review_comments.destroy

    redirect_to post_path(params[:post_id]), notice: 'コメントを削除しました。'
  end

  private

  def post_review_comments_params
    params.require(:post_review_comment).permit(:body)
          .merge(post_review_id: params[:post_review_id])
  end
end
