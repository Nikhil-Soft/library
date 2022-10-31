class UsersController < ApplicationController

	def edit 
		@user = current_user
	end

	def update
		if current_user.update(users_params)
			redirect_to dailies_path
		else
			render :edit, status: :unprocessable_entity
		end
	end

	private

	def users_params
		params.require(:user).permit(:salary)
	end

end
