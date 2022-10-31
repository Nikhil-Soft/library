module DailiesHelper
	def check_limit
		@monthly = current_user.dailies.map{|x| x.expenses}.sum
	end
end
