class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create do
    self.update_column(:user_name, "#{self.full_name.downcase.split(" ").join("_")}_#{self.mobile_no.to_s.last(2)}")
    UserMailer.with(user: self).welcome_email.deliver_now
    # session[:current_user] = self
  end

  has_one :cart

end
