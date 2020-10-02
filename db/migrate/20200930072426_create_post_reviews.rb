class CreatePostReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :post_reviews do |t|
      t.timestamps

      t.belongs_to :post, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.text :body, default: '', null: false
    end
  end
end
