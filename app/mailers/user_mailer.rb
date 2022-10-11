class UserMailer  < ApplicationMailer
	default from: 'railsdeveloper100@gmail.com'

	def welcome_email
		@user = params[:user]
		@url = 'http://youtube.com'
		mail(to: @user.email, subject: 'Welcome to My Site')
	end
end
