class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :basic_auth
  before_action :configure_permit_parameters, if: :devise_controller?
  protected

  def configure_permit_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:first_name, :family_name, :first_name_reading, :family_name_reading, :nickname, :birthday])
  end

  

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
