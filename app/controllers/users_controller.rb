class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		respond_to do |format|
			format.html
			format.json { render json: @user }
		end
	end

	def index
		@users = User.all
		@user_names = User.all.map{|t| t.name}
		respond_to do |format|
			format.html
			format.json { render json: {userNames: @user_names } }
		end
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
