	class ActorsController < ApplicationController

	def index
		@actors = Actor.all 
	end

	def new 
		@actor = Actor.new
	end

	def create
		@actor = Actor.new(actors_params)
		if @actor.save
			# unless params[:id].present?
			# @actor.pictures.create(name: "#{@actor.name.split(" ").join.tableize}_picture", image: params['actor']['images'])
			# end
			redirect_to @actor
		else
			render :new , status: :unprocessable_entity
		end
	end

	def show 
		@actor = Actor.find(params[:id])
		@profile_picture = @actor.pictures
	end

	private

	def actors_params
		params.require(:actor).permit(:name, :movies_count, :age, :experiences)
	end


end
