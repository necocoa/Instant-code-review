class PostReviewLikesController < ApplicationController
  # POST /posts/:post_id/post_reviews/:post_review_id/post_review_likes
  def create
    current_user.post_review_likes.create!(post_review_id: params[:post_review_id])

    @post = Post.find(params[:post_id])
    @post_review = PostReview.find(params[:post_review_id])
    respond_to do |format|
      format.html { redirect_back fallback_location: post_path(params[:post_id]) }
      format.js
    end
  end

  # DELETE /posts/:post_id/post_reviews/:post_review_id/post_review_likes
  def destroy
    current_user.post_review_likes.find_by!(post_review_id: params[:post_review_id]).destroy!

    @post = Post.find(params[:post_id])
    @post_review = PostReview.find(params[:post_review_id])
    respond_to do |format|
      format.html { redirect_back fallback_location: post_path(params[:post_id]) }
      format.js
    end
  end
end
