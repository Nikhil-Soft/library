class Team < ApplicationRecord
	has_and_belongs_to_many :sponsors

	validates :name , uniqueness: true
end
