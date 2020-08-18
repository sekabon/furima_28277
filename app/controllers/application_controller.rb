class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?
  #before_action :move_to_index, except: :index
  protected
  
  def configure_permitted_parameters 
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :family_name, :first_name_reading, :family_name_reading, :nickname, :birthday])  
  end
  

  private
  #def move_to_index
    #redirect_to action: :index unless user_signed_in?
  #end
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
