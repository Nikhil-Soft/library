class Sponsor < ApplicationRecord
	has_and_belongs_to_many :teams

	validates :name , uniqueness: true
end
