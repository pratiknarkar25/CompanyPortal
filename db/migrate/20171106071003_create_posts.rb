class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.integer :category_id, null: false
      t.integer :user_id, null: false
      t.string :address
      t.string :zip, limit: 255
      t.decimal :price, precision: 14, scale: 2
      t.string :contact_number
      t.boolean :published
      t.datetime :published_date
      t.timestamps
    end
  end
end
