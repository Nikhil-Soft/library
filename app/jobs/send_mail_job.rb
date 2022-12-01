class SendMailJob < ApplicationJob
  queue_as :default

  def perform
    puts "******Done******"
    # Daily.all.pluck(:user_id).uniq.each do |user_id|
    #   @user = User.find_by(id: user_id)
    #   @daily = @user.dailies
    #   @monthly = @user.dailies.map{|x| x.expenses}.sum
    #   UserMailer.with(user: @user, daily: @daily, monthly: @monthly).send_daily.deliver_now
    # end
  end
end
