class PostReviewLikesController < ApplicationController
  # POST /posts/:post_id/post_reviews/:post_review_id/post_review_likes
  def create
    like = current_user.post_review_likes.new(post_review_id: params[:post_review_id])
    like.user_not_to_be current_user
    like.save!

    respond_to do |format|
      format.html { redirect_back fallback_location: post_path(params[:post_id]) }
      format.js do
        @post = Post.find(params[:post_id])
        @post_review = PostReview.find(params[:post_review_id])
      end
    end
  end

  # DELETE /posts/:post_id/post_reviews/:post_review_id/post_review_likes
  def destroy
    like = current_user.post_review_likes.find_by!(post_review_id: params[:post_review_id])
    like.destroy!

    respond_to do |format|
      format.html { redirect_back fallback_location: post_path(params[:post_id]) }
      format.js do
        @post = Post.find(params[:post_id])
        @post_review = PostReview.find(params[:post_review_id])
      end
    end
  end
end
