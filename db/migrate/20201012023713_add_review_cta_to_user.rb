class AddReviewCtaToUser < ActiveRecord::Migration[6.0]
  def change
    change_table :users, bulk: true do |t|
      t.string :reviewer_url
      t.string :call_to_action_message
    end
  end
end
