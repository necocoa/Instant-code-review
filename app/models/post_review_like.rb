# == Schema Information
#
# Table name: post_review_likes
#
#  id             :bigint           not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  post_review_id :bigint           not null
#  user_id        :bigint           not null
#
# Indexes
#
#  index_post_review_likes_on_post_review_id              (post_review_id)
#  index_post_review_likes_on_user_id                     (user_id)
#  index_post_review_likes_on_user_id_and_post_review_id  (user_id,post_review_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (post_review_id => post_reviews.id)
#  fk_rails_...  (user_id => users.id)
#
class PostReviewLike < ApplicationRecord
  belongs_to :user
  belongs_to :post_review

  validates :user, uniqueness: { scope: :post_review, message: 'は既にいいねしています' }
  # TODO: validates 自分はいいね出来ない
end
