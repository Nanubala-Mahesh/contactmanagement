class Contact < ActiveRecord::Base
	has_many :addresses, :dependent => :destroy
	accepts_nested_attributes_for :addresses, allow_destroy: true

	belongs_to :user


	has_many :phones, :dependent => :destroy
	accepts_nested_attributes_for :phones, allow_destroy: true

	validates_associated :phones
end
