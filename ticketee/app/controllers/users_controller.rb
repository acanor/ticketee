class UsersController < ApplicationController
  	before_action :set_user, only: [:show, :edit, :update]

	def new
  		@user = User.new
	end

  	def create
		@user = User.new(user_params)
		
		if @user.save
			session[:user_id] = @user.id
			flash[:notice] = "You have signed up successfully."
			redirect_to projects_path
		else
			render :new
		end
  	end

  	def show
  	end

	def edit
	end

	def update
		@user.update(user_params)

		flash[:notice] = "Profile has been updated."
		redirect_to @user
	end
	private
		def user_params
			params.require(:user).permit(:name, :password, :password_confirmation, :email)
		end

		def set_user
			@user = User.find(params[:id])
			rescue ActiveRecord::RecordNotFound
			flash[:alert] = "El usuario que está buscando no puede ser encontrado"
			redirect_to users_path
		end
end
