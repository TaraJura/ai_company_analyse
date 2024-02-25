# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

  # POST /resource
  def create
    super do |user|
      user.extension_user_id = params[:extension_user_id]
    end
  end


  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:extension_user_id])
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    extension_index_path
  end
end
