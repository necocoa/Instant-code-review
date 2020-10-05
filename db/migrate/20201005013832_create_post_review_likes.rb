class CreatePostReviewLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :post_review_likes do |t|
      t.timestamps

      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :post_review, null: false, foreign_key: true
    end
    add_index :post_review_likes, %i[user_id post_review_id], unique: true
  end
end
