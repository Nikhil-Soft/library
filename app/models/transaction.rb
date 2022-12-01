class Transaction < ApplicationRecord
	belongs_to :daily
	belongs_to :send_to, class_name: 'User'
	belongs_to :send_by, class_name: 'User'
end
