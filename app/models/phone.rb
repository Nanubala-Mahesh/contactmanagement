class Phone < ActiveRecord::Base
	belongs_to :contact


	validates_numericality_of :phone_number
	validates_length_of :phone_number, is: 10
end
