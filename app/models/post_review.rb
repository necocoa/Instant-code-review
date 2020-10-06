# == Schema Information
#
# Table name: post_reviews
#
#  id         :bigint           not null, primary key
#  body       :text             default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_post_reviews_on_post_id  (post_id)
#  index_post_reviews_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (post_id => posts.id)
#  fk_rails_...  (user_id => users.id)
#
class PostReview < ApplicationRecord
  belongs_to :post
  belongs_to :user

  has_many :likes, class_name: 'PostReviewLike', dependent: :destroy

  validates :body, presence: true, length: { in: 10..10000 }

  scope :order_by_number_of_likes, -> {
    left_joins(:likes)
      .group('post_reviews.id')
      .order('count(post_review_likes.id) DESC, post_reviews.created_at ASC')
  }
end
