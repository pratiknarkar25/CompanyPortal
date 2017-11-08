class Post < ApplicationRecord
	validates :title, presence: true, length: { maximum: 250 }
	validates :description, presence: true, length: { maximum: 65530 }
	belongs_to :category
	belongs_to :user
end
