class TeamsController < ApplicationController
	def index
		@teams = Team.all
	end

	def new 
		@team = Team.new
	end

	def create 
		@team = Team.new(teams_params)
		if @team.save
			redirect_to @team
		else
			render :new , status: :unprocessable_entity
		end
	end

	def show 
		@team = Team.find(params[:id])
	end

	def edit
		@team = Team.find_by(id: params[:id])
	end

	def update
		@team = Team.find_by(id: params[:id])
		@sponsor = Sponsor.find_by(id: params[:team][:sponsor_id])
		@team.sponsors << @sponsor
		redirect_to team_path(@team)
	end

	private

	def teams_params
		params.require(:team).permit(:name , :player)
	end

end
