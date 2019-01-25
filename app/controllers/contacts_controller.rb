class ContactsController < ApplicationController
	before_action :set_contact, only: [:show, :edit, :update, :destroy]

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
  end

  def update
  	if @contact.update(contact_params)
  		flash[:success] = "Contact has been updated..."
  		redirect_to contacts_path
  	else
  		flash.now[:danger] = "Oops!, something went wrong. Try again"
  		render :edit
  	end
  end

  def destroy
  	@contact.destroy
  	flash[:success] = "Contact has been deleted..."
  	redirect_to contacts_path
  end

  private
  	def set_contact
  		@contact = Contact.find(params[:id])
  	end

  	def contact_params
  		params.require(:contact).permit(:name, :email, :phone, :company, :address, :group_id)
  	end
end
