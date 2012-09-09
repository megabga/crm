class ApplicationController < ActionController::Base
  protect_from_forgery
  check_authorization :unless => :devise_controller? #cancan
  
  include SessionsHelper
  
  rescue_from CanCan::AccessDenied do |exception|
      redirect_to root_url, :flash => { :error => exception.message }
  end
end
