class UserMailer  < ApplicationMailer
	default from: 'railsdeveloper100@gmail.com'

	def welcome_email
		@user = params[:user]
		@url = 'http://youtube.com'
		mail(to: @user.email, subject: 'Welcome to My Site')
	end

	def exceed_limit
		@user = params[:user]
		@limit = params[:limit]
		mail(to: @user.email, subject: 'Cross limit Please stop Expenses')
	end

	def send_daily
		@user = params[:user]
		@daily = params[:daily]
		@monthly = params[:monthly]
		attachments["daily_#{@user.dailies.count}.pdf"] = WickedPdf.new.pdf_from_string(
		render_to_string(pdf: 'daily', template: 'dailies/expenses', layout: 'pdf', daily: @user.dailies)
    	)
		mail(to: @user.email, subject: 'Your todo PDF is attached', user: @user)
	end

end
