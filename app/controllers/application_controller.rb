class ApplicationController < ActionController::Base
	include Pundit
	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
	rescue_from ActiveRecord::RecordNotFound, with: :display_404_error
	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resource)
		stored_location_for(resource) || contacts_path
	end

	private
		def user_not_authorized
			flash[:danger] = "You are not authorized to perform this action."
			redirect_to action: :index
		end

		def display_404_error
			render template: 'shared/404', status: 404
		end

  protected
	  def configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
	    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
	  end
end
