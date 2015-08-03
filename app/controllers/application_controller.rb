class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :configure_permitted_parameters, if: :devise_controller?

  #rescue - apparently, this works!
  rescue_from ActiveRecord::RecordNotFound do
    flash[:warning] = 'Resource not found.'
    redirect_back_or root_path
  end
   
  def redirect_back_or(path)
    redirect_to request.referer || path
  end

  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:name)}
  	devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:name)}
  end

end
