class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from ActiveRecord::RecordNotFound do |exception|
    redirect_to root_path, notice: 'Not Found' # nothing, redirect or a template
  end

  def after_sign_in_path_for(resource)
    current_user.resume ? search_results_path : new_resume_path
  end

  protected
    ## Permit first_name & last_name for user registration
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone])
    end
end
