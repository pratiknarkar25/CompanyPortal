# frozen_string_literal: true

# Modify published to deactivated columns
class ChangePublishedToDeactivated < ActiveRecord::Migration[5.1]
  def change
    rename_column :posts, :published, :deactivated
    change_column :posts, :deactivated, :boolean, default: false
    rename_column :posts, :published_date, :deactivation_date
  end
end
