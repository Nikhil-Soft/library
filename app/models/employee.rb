class Employee < ApplicationRecord
	belongs_to :manager, class_name: :Employee, optional: true
	has_many :employees, class_name: :Employee, foreign_key: :manager_id

	scope :nikhil, -> { where(name: "Nikhil") } 
	scope :deepak, -> { where(manager_id: 11) }

end
