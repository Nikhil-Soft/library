class Daily < ApplicationRecord
	belongs_to :user
	has_many :transactions

	after_commit :create_notifications, on: :create


	def self.search(search, current_user)
		if search
			current_user.dailies.where(" details Like ? ", "%#{search}%")			
		else
			@daily = current_user.dailies
		end
	end

	def create_notifications 
		Notification.create do |notification|
			notification.notify_type = "post"
			notification.actor = self.user
			notification.user = self.user
			notification.target = self
		end
	end
end
