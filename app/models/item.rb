class Item < ApplicationRecord
	belongs_to :maker
	belongs_to :category
	belongs_to :admin
	attachment :item_image
	has_many :reviews
	# belongs_to :user
  	has_many :iines, dependent: :destroy


	def iine_user(user_id)
    iines.find_by(user_id: user_id)
  end

	def self.search(search)
    if search
      Item.where(['title LIKE :item ', item: "%#{search}%"])
    else
      Item.all.order(id: "DESC")
    end
	end

end
