class ReviewsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create]
	def index
		@item = Item.find(params[:item_id])
		@reviews = Review.where(item_id: @item.id).order("id DESC")
	end

	def new
		if user_signed_in?
		@item = Item.find(params[:item_id])
		@review = Review.new
	else
		redirect_to root_path, notice: "無効なURLです。"
	end
	end

	def create
		@item = Item.find(params[:item_id])
		@review = Review.new(review_params)
		@review.item_id = params[:item_id]
		# binding.pry
		@review.save
		redirect_to item_path(@item.id)
	end
	private
		def review_params
    	params.require(:review).permit(:user_id,:item_id,:star,:star2,:star3,:star4,:star5,:item_review,:review_star,:review_star2,:review_star3,:review_star4,:review_star5)
	end

end
