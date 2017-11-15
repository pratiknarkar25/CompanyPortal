# frozen_string_literal: true

# Add database interactions for comments here
class Comment < ApplicationRecord
  has_ancestry
  belongs_to :commentable, polymorphic: true
  validates :content, presence: true
  belongs_to :user
end
