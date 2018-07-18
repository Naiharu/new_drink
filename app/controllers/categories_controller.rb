class CategoriesController < ApplicationController
	def index
		if admin_signed_in?
		@categories = Category.all
		@category = Category.new
	else
		redirect_to root_path, notice: "無効なURLです。"
	end
	end

	def edit
		if admin_signed_in?
		@category = Category.find(params[:id])
		else
		redirect_to root_path, notice: "無効なURLです。"
	end
	end

	def update
		@category = Category.find(params[:id])
		@category.update(category_params)
		redirect_to categories_path
	end

	def create
		@category = Category.new(category_params)
		@category.save
		redirect_to categories_path
	end

	private
		def category_params
    	params.require(:category).permit(:category_name)
	end

end
