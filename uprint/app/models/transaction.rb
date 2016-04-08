class Transaction < ActiveRecord::Base
	belongs_to :shop
	belongs_to :student
end
