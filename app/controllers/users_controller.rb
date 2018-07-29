class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:edit, :show, :update]
	def edit
		if User.exists?(id: params[:id])
			if user_signed_in?
				@user = User.find(params[:id])
			else
				redirect_to root_path, notice: "無効なURLです。"
			end
		else
			redirect_to root_path, notice: "無効なURLです。"
		end
	end

	def show
		if User.exists?(id: params[:id])
			if user_signed_in?
				@user = User.find(params[:id])
				@reviews = Review.where(user_id: @user.id).limit(5).order("id DESC")
			else
				redirect_to root_path
			end
		else
			redirect_to root_path, notice: "無効なURLです。"
		end
	end

	def update
		if user_signed_in?
			@user = User.find(params[:id])
	     	if @user.update(user_params)
	        	redirect_to user_path(@user.id)
	    	else
	      		render :edit
	    	end
	    end
	end

	def following
      @user  = User.find(params[:id])
      @users = @user.followings
      render 'show_follow'
 	end

  	def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  	end
  	

  	def destroy
	@user = User.find(params[:id])
	@user.destroy
	redirect_to root_path
	end

  	def user_password_edit
  		if User.exists?(id: params[:id])
		@user = User.find(params[:id])
		end
	end

	private
		def user_params
    	params.require(:user).permit(:name,:age,:email,:favorite,:user_image,:sex,:password)
	end

end
