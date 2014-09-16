class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
	end

	def index
		@user_names = User.all
	end

	def new
	end

	def create
		@user = User.create(user_params)
		redirect_to @user
	end

	def user_params
		params.require(:user).permit(:first_name, :last_name, :email)
	end

	
end
