# frozen_string_literal: true

# This is a model for posts
class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250 }
  validates :description, presence: true, length: { maximum: 65_530 }
  belongs_to :category
  belongs_to :user
  has_many :comments, as: :commentable
end
