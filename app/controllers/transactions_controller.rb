class TransactionsController < ApplicationController

	def index
		@transactions = current_user.transfer_transaction 
	end

	def new
		@daily = Daily.find(params[:format])
		@transaction = current_user.transfer_transaction.new
	end

	def create
		@transaction = current_user.transfer_transaction.new(transaction_params)
		if @transaction.save
			redirect_to transactions_path
		else
			render :new, status: :unprocessable_entity
		end
	end

	private

	def transaction_params
		params.require(:transaction).permit(:name, :daily_id, :send_to_id, :send_by_id)
	end

end
