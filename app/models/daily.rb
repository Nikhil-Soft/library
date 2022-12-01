class Daily < ApplicationRecord
	belongs_to :user
	has_many :transactions


	def self.search(search, current_user)
		if search
			current_user.dailies.where(" details Like ? ", "%#{search}%")			
		else
			@daily = current_user.dailies
		end
	end



end
