# frozen_string_literal: true

# Here pictures/images can be added to post
class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.attachment :image
      t.integer :post_id
      t.timestamps
    end
  end
end
