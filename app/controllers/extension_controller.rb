# frozen_string_literal: true

class ExtensionController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @extension_client = current_user.client

    if @extension_client.nil?
      redirect_to root_path, alert: "You don't have access to the extension, please contact support"
    end

  end

  def receiver
    begin
      client = Client.find_or_create_by!(token_identifier: params[:token_identifier], ip_address: request.remote_ip)

      client.extension_data.create!(data: params[:data], url_send_from: params[:url_send_from])
    rescue StandardError => e
      render json: { message: "Error in extension_controller line 12" }
      return
    end

    render json: { message: "Data processed successfully" }
  end
end
