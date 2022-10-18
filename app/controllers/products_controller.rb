class ProductsController < ApplicationController
	before_action :current_user
	
	def index
		@products = Product.all 
	end

	def new
		@product = Product.new
	end

	def create 
		@product = Product.new(product_params)
		if @product.save
			redirect_to @product
		else
			render :new, status: :unprocessable_entity
		end
	end

	def show 
		@product = Product.find(params[:id])
	end

	private

	def product_params
		params.require(:product).permit(:name, :price, :category_id)
	end
end
