class MakersController < ApplicationController
	before_action :authenticate_user!, except: [:index, :new, :create, :edit, :update]
	def index
		if admin_signed_in?
		@makers = Maker.all
		@maker = Maker.new
	else
		redirect_to root_path, notice: "無効なURLです。"
	end
	end

	def edit
		if admin_signed_in?
		@maker = Maker.find(params[:id])
	else
		redirect_to root_path, notice: "無効なURLです。"
	end
	end

	def update
		@maker = Maker.find(params[:id])
		@maker.update(maker_params)
		redirect_to makers_path
	end

	def new
	end

	def create
		@maker = Maker.new(maker_params)
		@maker.save
		redirect_to makers_path
	end

	private
		def maker_params
    	params.require(:maker).permit(:maker_name)
	end

end
