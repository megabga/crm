class ApplicationController < ActionController::Base
  protect_from_forgery
  check_authorization :unless => :devise_controller? #cancan
  
  include SessionsHelper
end
