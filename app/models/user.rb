# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  call_to_action_message :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string
#  profile                :text
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  reviewer_url           :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :post_reviews, dependent: :destroy
  has_many :post_review_likes, dependent: :destroy
  has_many :post_review_comments, dependent: :destroy

  validates :name, length: { in: 2..30 }, allow_blank: true
  validates :profile, length: { maximum: 1000 }, allow_blank: true
  validates :reviewer_url, length: { maximum: 255 },
                           format: /\A#{URI::DEFAULT_PARSER.make_regexp(%w[http https])}\z/,
                           allow_blank: true
  validates :call_to_action_message, length: { maximum: 100 }, allow_blank: true

  def already_post_review_liked?(post_review)
    post_review_likes.exists?(post_review_id: post_review.id)
  end
end
