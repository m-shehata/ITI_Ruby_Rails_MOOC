class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
 # private

# If your model is called User
# In order for this to work, you must make use of devise's authenticate_user! method.
# You can either place this in a before_filter on your application controller or in each individual controller.
  def after_sign_in_path_for(resource)
   session["user_return_to"] || root_path
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :date_of_birth, :gender, :attachment])
  end
  
  def authenticate_active_admin_user!
    authenticate_user!
    unless current_user.superadmin?
      flash[:alert] = "Unauthorized Access!"
      redirect_to root_path
    end
  end  
  
end
