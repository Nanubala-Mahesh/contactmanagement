class ContactsController < ApplicationController
	
	before_action :authenticate_user!
	def index
		@contacts = current_user.contacts
	end

	def new
		@contact = Contact.new
		@phone = Phone.new
	end
	
	def show
		@contact = Contact.find(params[:id])
	end

	def create
		@contact = Contact.new(contact_params)
		@contact.user_id = current_user.id

		respond_to do |format|
			if @contact.save
				format.html { redirect_to contacts_url, notice: 'Contact was successfully created.' }
				
			else
				format.html { render :new }
			end
		end
	end

	def edit
		@contact = Contact.find(params[:id])
	end
	def update
		@contact = Contact.find(params[:id])
		if @contact.update_attributes(contact_params)
			redirect_to contact_path(@contact.id), notice: "Successfully updated"
		else 
			render action: "edit"
		end
	end
	def destroy
		@contact = Contact.find(params[:id])
		@contact.destroy
		redirect_to contacts_path, notice: "Successfull deleted #{@contact.first_name}"
	end

	private
	def contact_params
		params.require(:contact).permit(:first_name, :last_name, :phones_attributes => [:id, :phone_number, :_destroy], :addresses_attributes => [:id, :address, :country, :_destroy])
	end




end
