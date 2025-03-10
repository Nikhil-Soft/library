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
  has_many :dailies

  has_many :receive_transaction, class_name: "Transaction", foreign_key: "send_to_id"
  has_many :transfer_transaction, class_name: "Transaction", foreign_key: "send_by_id"

end
