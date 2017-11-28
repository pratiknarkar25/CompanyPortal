# frozen_string_literal: true

# This is a model for categories
class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  has_many :posts, dependent: :destroy
end
