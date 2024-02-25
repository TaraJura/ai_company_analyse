# frozen_string_literal: true

class ExtensionController < ApplicationController
  skip_before_action :verify_authenticity_token

  def receiver
    begin
      client = Client.find_or_create_by!(token_identifier: params[:token_identifier], ip_address: request.remote_ip)

      client.extension_data.create!(data: params[:data])
    rescue StandardError => e
      render json: { message: "Error in extension_controller line 12" }
      return
    end

    render json: { message: "Data processed successfully" }
  end
end
