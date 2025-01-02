# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController

  # Prevent creating new registrations
  def create
    redirect_back(fallback_location: root_path, alert: "Registration is currently disabled.")

  end
end
