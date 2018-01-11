# frozen_string_literal: true

# This is a model for posts
class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250 }
  validates :description, presence: true, length: { maximum: 65_530 }
  validates :address, presence: true, length: { maximum: 65_530 }
  validates :contact_number, length: { minimum: 10, maximum: 15 }
  validates_format_of :contact_number,
                      with: /\d[0-9]\)*\z/,
                      message: ': only positive number without
                       spaces are allowed'
  validates :price, numericality: { greater_than: 0, less_than: 10_000_000_000 }
  belongs_to :category
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :pictures, dependent: :destroy

  PER_PAGE = 30
  scope :active, -> { where('deactivated = ? or deactivated = ?', false, nil) }
end
