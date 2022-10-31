class DailiesController < ApplicationController

	before_action :current_user
	
	include DailiesHelper

	def index
		@daily = current_user.dailies
		respond_to do |format|
      		format.html
      		format.pdf do

      			render pdf: "Dailies: #{@daily.count}",
               		template: "dailies/index",
               		formats: [:html],
               		disposition: :inline,
               		layout: 'pdf'
               		# save_to_file: Rails.root.join('pdfs', "#{@daily.count}.pdf"),
               		# save_only: true
            end
        end
	end

	def new
		@daily = current_user.dailies.new
	end

	def create
		@monthly = check_limit
		UserMailer.with(user: current_user, limit: (current_user.salary - @monthly)).exceed_limit.deliver_now if current_user.salary < @monthly
		@daily = current_user.dailies.new(daily_params)
		if @daily.save 
			redirect_to @daily
		else
			render :new , status: :unprocessable_entity
		end
	end

	def edit
		@daily = Daily.find(params[:id])
	end

	def update
		@daily = Daily.find(params[:id])
		if @daily.update(daily_params)
			redirect_to @daily
		else
			render :new , status: :unprocessable_entity
		end
	end

	def show
		@daily = Daily.find(params[:id])
	end

	def destroy
		@daily = Daily.find(params[:id])
		@daily.destroy
		redirect_to @daily, status: :see_other
	end

	def send_daily

		# pdf_html = ActionController::Base.new.render_to_string(template: 'dailies/index', layout: 'pdf')
		# pdf = WickedPdf.new.pdf_from_string(pdf_html)
		# send_data pdf, filename: 'daily.pdf'
		@monthly = check_limit
		UserMailer.with(user: current_user, daily: current_user.dailies, monthly: @monthly).send_daily.deliver_now
		redirect_to dailies_path

 		# @daily  = Daily.find.(params[:id])
 		# mail(to: @daily.email, subject: "You have a new load to daily")
	end

	private

	def daily_params
		params.require(:daily).permit(:date, :expenses, :details)
	end

end