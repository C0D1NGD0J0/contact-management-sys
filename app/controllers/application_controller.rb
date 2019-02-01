class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	include Pundit

	def after_sign_in_path_for(resource)
		stored_location_for(resource) || contacts_path
	end

  protected
	  def configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
	    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
	  end
end
