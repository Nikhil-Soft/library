class CartItemsController < ApplicationController
	before_action :current_user

	def create
		check_cart
		cart_item = @cart.cart_items.find_by(product_id: params[:product_id])
		if cart_item
			cart_item.quantity += 1
		else
			cart_item =  @cart.cart_items.new(product_id: params[:product_id], quantity: 1)
		end
		if cart_item.save
			redirect_to products_path
		else 
			render :new, status: :unprocessable_entity
		end
	end

	def destroy
		@cart_item = CartItem.find_by(id: params[:cart_item_id])
		if @cart_item
			@cart_item.destroy
			redirect_to @cart_item.cart
		end
	end

	def increment
		@cart_item = CartItem.find_by(id: params[:cart_item_id])
		if @cart_item 
			@cart_item.quantity += 1
		end
		if @cart_item.save
			redirect_to @cart_item.cart
		else
			render :edit , status: :unprocessable_entity
		end
	end

	def decrement
		@cart_item = CartItem.find_by(id: params[:cart_item_id])
		if @cart_item.quantity >= 1
			@cart_item.quantity -= 1
		end
		if @cart_item.save
			redirect_to @cart_item.cart
		else
			render :edit , status: :unprocessable_entity
		end
	end

	private 

	def check_cart
		if current_user.cart.present?
			@cart = current_user.cart
		else
			@cart = current_user.create_cart
		end
	end

	def items_params
		params.require(:cart_item).permit(:protuct_id, :quantity, :cart_id)
	end
end