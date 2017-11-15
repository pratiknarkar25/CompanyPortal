# frozen_string_literal: true

# Comments can be added to any model using polymorphism
class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :commentable_id
      t.string :commentable_type
      t.integer :user_id
      t.string :ancestry
      t.timestamps
    end
    add_index :comments, %i[commentable_id commentable_type]
    add_index :comments, %i[ancestry]
  end
end
