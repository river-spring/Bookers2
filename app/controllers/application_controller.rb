class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
	end
	def after_sign_in_path_for(resourse)
		user_path(resourse)
	end
	def after_sign_out_path_for(resourse)
		homes_path
	end
	private
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up,keys:[:email, :postcode, :adress, :street])
	end
end
