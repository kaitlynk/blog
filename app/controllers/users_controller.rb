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
		@user = User.new
	end

	def create
		@user = User.create(user_params)
		redirect_to @user
	end

	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password)
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		respond_to do |format|
			if @user.update(user_params)
				format.html{redirect_to @user, notice: 'User was successfully updated!'}
				format.json{head :no_content}
			else
				format.html{render action:'edit'}
				format.json{render json: @user.errors, status: :unprocessable_entity }
			end
		end
	end
	
end
