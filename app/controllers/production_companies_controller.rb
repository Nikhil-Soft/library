class ProductionCompaniesController < ApplicationController

	def index
		@productions = ProductionCompany.all 
	end

	def new 
		
		@production = ProductionCompany.new
	end

	def create 

		@production = ProductionCompany.new(productions_params)
		if @production.save
			redirect_to @production
		else
			render :new , status: :unprocessable_entity
		end
	end

	def show 
		@production = ProductionCompany.find(params[:id])
		@picture = @production.pictures
	end

	private

	def productions_params
		params.require(:production_company).permit(:turnover, :name, :movies_count)
	end

end
