class ContactsController < ApplicationController
  def index
  	if params[:group_id] && !params[:group_id].empty?
  		@contacts = Contact.where(group_id: params[:group_id]).order(created_at: :desc).page(params[:page])
  	else
  		@contacts = Contact.order(created_at: :desc).page(params[:page])
  	end
  end

  def new 
  	@contact = Contact.new
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

  def edit
  	@contact = Contact.find(params[:id])
  end

  def update
  	@contact = Contact.find(params[:id])
  	if @contact.update(contact_params)
  		flash[:success] = "Contact has been updated..."
  		redirect_to contacts_path
  	else
  		flash.now[:danger] = "Oops!, something went wrong. Try again"
  		render :edit
  	end
  end

  private
  	def contact_params
  		params.require(:contact).permit(:name, :email, :phone, :company, :address, :group_id)
  	end
end
