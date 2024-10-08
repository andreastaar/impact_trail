class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :role, :location, :instagram_account, :facebook_account, :organization_name, :description, :city_name, :full_location, :photo, :organization_address])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :role, :location, :instagram_account, :facebook_account, :organization_name, :city_name, :full_location, :description, :photo, :organization_address])
  end
end
