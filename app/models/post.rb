# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  body       :text             default(""), not null
#  title      :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_posts_on_created_at  (created_at)
#  index_posts_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Post < ApplicationRecord
  belongs_to :user
  has_many :reviews, class_name: 'PostReview', dependent: :destroy

  validates :title, presence: true, length: { in: 5..100 }
  validates :body, presence: true, length: { in: 10..10000 }

  scope :recent, -> { order(created_at: :desc) }
end
