class CreatePostReviewComments < ActiveRecord::Migration[6.0]
  def change
    create_table :post_review_comments do |t|
      t.timestamps

      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :post_review, null: false, foreign_key: true
      t.text :body, default: '', null: false
    end
  end
end
