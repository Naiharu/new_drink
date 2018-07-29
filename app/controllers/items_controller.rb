class ItemsController < ApplicationController
	def index
		@items = Item.search(params[:search])
	end

	def show
		if Item.exists?(id: params[:id])
			@item = Item.find(params[:id])
			@reviews = Review.where(item_id: @item.id).limit(3).order("id DESC")
			@average = Review.where(item_id: @item.id).average(:star)
			@average2 = Review.where(item_id: @item.id).average(:star2)
			@average3 = Review.where(item_id: @item.id).average(:star3)
			@average4 = Review.where(item_id: @item.id).average(:star4)
			@average5 = Review.where(item_id: @item.id).average(:star5)
	    else
			redirect_to root_path, notice: "無効なURLです。"
		end
	end

	def new
		if admin_signed_in?
			@admin = current_admin.id
			@item = Item.new
		else
			redirect_to root_path, notice: "無効なURLです。"
		end
	end

	def create
		@admin = current_admin.id
		@item = Item.new(item_params)
		# binding.pry
		@item.save
		redirect_to root_path
	end

	def edit
		if Item.exists?(id: params[:id])
			if admin_signed_in?
				@admin = current_admin.id
				@item = Item.find(params[:id])
			else
				redirect_to root_path, notice: "無効なURLです。"
			end
		else
			redirect_to root_path, notice: "無効なURLです。"
		end
	end

	def update
		@admin = current_admin.id
		@item = Item.find(params[:id])
		@item.update(item_params)
		redirect_to items_path
	end


	def top
		@items = Item.limit(5).order("id DESC")
		@reviews = Review.limit(5).order("id DESC")
		@iines = Item.limit(5).order("iines_count DESC")
	end

	def destroy
	@item = Item.find(params[:id])
	@item.destroy
	redirect_to items_path
	end

	private
	def item_params
    	params.require(:item).permit(:admin_id,:item_image,:title,:url,:category_id,:maker_id,:price,:calorie,:comment,:age,:iines_count)
	end

end
