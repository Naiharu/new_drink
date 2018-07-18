class UsersController < ApplicationController
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
				@reviews = Review.where(user_id: @user.id).limit(3).order("id DESC")
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
	        	redirect_to user_path(@user.id), notice: "更新できました。"
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
  	
	private
		def user_params
    	params.require(:user).permit(:name,:age,:email,:user_image,:sex,:password)
	end

end
