class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.timestamps

      t.references :user, foreign_key: true, null: false
      t.string :title, null: false, default: ''
      t.text :body, null: false, default: ''
    end
  end
end
