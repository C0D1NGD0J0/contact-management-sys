class ContactsController < ApplicationController
  def index
  	if params[:group_id] && !params[:group_id].empty?
  		@contacts = Contact.where(group_id: params[:group_id]).page(params[:page])
  	else
  		@contacts = Contact.page(params[:page])
  	end
  end

  def new 
  	
  end

  def create
  	@contact = Contact.new(contact_params)
  	if @contact.save
  		flash[:success] = "Contact has been successfully added."
  		redirect_to contacts_path
  	else
  		flash.now[:danger] = "Oops!, please try again."
  		render :new
  	end
  end

  private
  	def contact_params
  		params.require(:contact).permit(:name, :email, :phone, :company, :address, :group_id)
  	end
end
