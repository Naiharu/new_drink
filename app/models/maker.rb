class Maker < ApplicationRecord
	has_many :items
	validates :maker_name, presence: true
end
