class PostReviewsController < ApplicationController
  # GET /posts/:post_id/post_reviews
  def index
    redirect_to post_path(params[:post_id])
  end

  # POST /posts/:post_id/post_reviews
  def create
    @post_review = current_user.post_reviews.new(post_review_params)

    if @post_review.save
      redirect_to post_path(params[:post_id])
    else
      @post = Post.find(params[:post_id])
      @post_reviews = @post.reviews.eager_load(:user).order(created_at: :desc)
      render 'posts/show'
    end
  end

  # DELETE /posts/:post_id/post_reviews/:id
  def destroy
    post_revirew = current_user.post_reviews.find(params[:id])
    post_revirew.destroy

    redirect_to post_path(params[:post_id]), notice: 'レビューを削除しました。'
  end

  private

  def post_review_params
    params.require(:post_review).permit(:body).merge(post_id: params[:post_id])
  end
end
