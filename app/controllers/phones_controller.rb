class PhonesController < ApplicationController
	def new
		@phone = Phone.new
	end

end
