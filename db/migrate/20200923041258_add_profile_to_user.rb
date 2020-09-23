class AddProfileToUser < ActiveRecord::Migration[6.0]
  def change
    change_table :users, bulk: true do |t|
      t.string :name
      t.text :profile
    end
  end
end
