class SponsorsController < ApplicationController

	def index 
		@sponsors = Sponsor.all 
	end

	def new 
		@sponsor = Sponsor.new
	end

	def create 
		@sponsor = Sponsor.new(sponsors_params)
		if @sponsor.save
			redirect_to @sponsor
		else
			render :new , status: :unprocessable_entity
		end
	end

	def show 
		@sponsor = Sponsor.find(params[:id])
	end

	def edit
		@sponsor = Sponsor.find_by(id: params[:id])
	end

	def update 

		if params[:sponsor][:turnover].present?
			@sponsor = Sponsor.find_by(id: params[:id])
		
		if @sponsor.update(sponsors_params)
			redirect_to @sponsor
		else
			render :edit , status: :unprocessable_entity
		end
		else

		@sponsor = Sponsor.find_by(id: params[:id])
		@team = Team.find_by(id: params[:sponsor][:team_id])
		@sponsor.teams << @team
		redirect_to sponsor_path(@sponsor)

		end
	end

	private

	def sponsors_params
		params.require(:sponsor).permit(:name , :turnover)
	end
 
end
