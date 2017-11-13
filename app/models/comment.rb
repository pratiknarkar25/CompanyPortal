# frozen_string_literal: true

# Add database interactions for comments here
class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  validates :content, presence: true
  belongs_to :user
end
