class CartsController < ApplicationController

	def show 
		@cart = current_user.cart
	end

	private

	def cart_params
		params.require(:cart).permit(:user_id)
	end

end