class PostReviewLikesController < ApplicationController
  # POST /posts/:post_id/post_reviews/:post_review_id/post_review_likes
  def create
    current_user.post_review_likes.create!(post_review_id: params[:post_review_id])
    # TODO: 非同期にする
    redirect_back fallback_location: post_path(params[:post_id]), notice: 'いいね!'
  end

  # DELETE /posts/:post_id/post_reviews/:post_review_id/post_review_likes
  def destroy
    like = current_user.post_review_likes.find_by!(post_review_id: params[:post_review_id])
    # TODO: 非同期にする
    like.destroy
    redirect_back fallback_location: post_path(params[:post_id]), alert: 'いいねを削除'
  end
end
