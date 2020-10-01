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
require 'rails_helper'

RSpec.describe PostReview, type: :model do
  describe 'validate' do
    let(:post_review) { build(:post_review, post: create(:post)) }
    it { expect(post_review).to be_valid }
  end
end
