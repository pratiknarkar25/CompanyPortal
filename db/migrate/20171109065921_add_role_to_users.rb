# frozen_string_literal: true

# Role column will be used for authorization
class AddRoleToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :role, :string
  end
end
