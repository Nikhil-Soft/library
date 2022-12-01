class TransfersController < ApplicationController

	def index 
		@transfers = Transfer.all 
	end

	def new
		@transfer = Transfer.new
	end

	def create 
		@transfer = Transfer.new(transfer_params)
		if @transfer.save
			redirect_to transfers_path
		else
			render :new , status: :unprocessable_entity
		end
	end

	def edit
		@transfer = Transfer.find(params[:id])
	end

	def update
		@transfer = Transfer.find(params[:id])
		if @transfer.update(transfer_params)
			redirect_to transfers_path
		else
			render :new , status: :unprocessable_entity
		end
	end

	def destroy
		@transfer = Transfer.find(params[:id])
		@transfer.destroy
		redirect_to @transfer, status: :see_other
	end

	private 

	def transfer_params
		params.require(:transfer).permit(:name , :status, :amount, :details)
	end

end
