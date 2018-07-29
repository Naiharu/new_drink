class Review < ApplicationRecord
	belongs_to :item
	belongs_to :user
	validates :star, presence: true
	validates :star2, presence: true
	validates :star3, presence: true
	validates :star4, presence: true
	validates :star5, presence: true
	validates :item_review, presence: true
end

