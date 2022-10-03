class PicturesController < ApplicationController

	before_action :set_actor

	def index 
		@pictures = Picture.all 
	end

	def new 
		@picture = @imageable.pictures.build
	end

	def create
		@picture = @imageable.pictures.build(profile_pictures_params)
		if @picture.save
			if params[:production_company_id].present? 
				redirect_to production_company_path(@imageable)
			else
				redirect_to actor_path(@imageable)
			end
		else
			render :new , status: :unprocessable_entity
		end
	end

	def show 
		@picture = Picture.find(params[:id])
	end

	private

	def set_actor
		@imageable = Actor.find_by(id: params[:actor_id]) if params[:actor_id]
		@imageable = ProductionCompany.find_by(id: params[:production_company_id]) if params[:production_company_id]
	end

	def profile_pictures_params
		params.require(:picture).permit(:name, :image)
	end

end
