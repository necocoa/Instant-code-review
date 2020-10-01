class PostReviewsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @post_review = current_user.post_reviews.new(post_review_params)

    if @post_review.save
      redirect_to @post
    else
      render 'posts/show'
    end
  end

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
