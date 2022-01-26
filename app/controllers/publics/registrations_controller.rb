# frozen_string_literal: true

class Publics::RegistrationsController < Devise::RegistrationsController

 before_action :configure_permitted_parameters, if: :devise_controller?
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :address, :postal_code, :telephone_namber])
  end

  def after_sign_up_path_for(resource)
    public_members_path
  end
end
