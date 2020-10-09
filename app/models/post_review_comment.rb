# == Schema Information
#
# Table name: post_review_comments
#
#  id             :bigint           not null, primary key
#  body           :text             default(""), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  post_review_id :bigint           not null
#  user_id        :bigint           not null
#
# Indexes
#
#  index_post_review_comments_on_post_review_id  (post_review_id)
#  index_post_review_comments_on_user_id         (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (post_review_id => post_reviews.id)
#  fk_rails_...  (user_id => users.id)
#
class PostReviewComment < ApplicationRecord
  belongs_to :user
  belongs_to :post_review

  validates :body, presence: true, length: { in: 2..10000 }
end
