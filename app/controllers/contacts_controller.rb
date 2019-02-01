class ContactsController < ApplicationController
  before_action :authenticate_user!
	before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index
  	session[:selected_group_id] = params[:group_id]
  	@contacts = current_user.contacts.by_group(params[:group_id]).search(params[:query]).order(created_at: :desc).page(params[:page])
  end

  def new 
  	@contact = Contact.new
  end

  def create
  	@contact = current_user.contacts.build(contact_params)
  	if @contact.save
  		flash[:success] = "Contact has been successfully added."
  		redirect_to contacts_path(previous_query_String)
  	else
  		flash.now[:danger] = "Oops!, please try again."
  		render :new
  	end
  end

  def edit
    authorize @contact
  end

  def update
    authorize @contact
  	if @contact.update(contact_params)
  		flash[:success] = "Contact has been updated..."
  		redirect_to contacts_path
  	else
  		flash.now[:danger] = "Oops!, something went wrong. Try again"
  		render :edit
  	end
  end

  def destroy
    authorize @contact
  	@contact.destroy
  	flash[:success] = "Contact has been deleted..."
  	redirect_to contacts_path
  end

  def autocomplete
    @contacts = current_user.contacts.search(params[:query]).order(created_at: :desc).page(params[:page])
  end

  private
  	def set_contact
  		@contact = Contact.find(params[:id])
  	end

  	def contact_params
  		params.require(:contact).permit(:name, :email, :phone, :company, :address, :group_id)
  	end

  	def previous_query_string
  		session[:selected_group_id] ? { group_id: session[:selected_group_id] } : {}
  	end
end
