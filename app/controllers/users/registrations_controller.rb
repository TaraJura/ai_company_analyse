# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # Prevent access to the new registration form
  def new
    redirect_to root_path, alert: "Registration is currently disabled."
  end

  # Prevent creating new registrations
  def create
    redirect_to root_path, alert: "Registration is currently disabled."
  end
end
