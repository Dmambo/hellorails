class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title, limit: 255
      t.text :text
      t.integer :comments_counter, null: false, default: 0
      t.integer :likes_counter, null: false, default: 0
      t.timestamps
    end
  end
end
