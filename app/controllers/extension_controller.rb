# frozen_string_literal: true

class ExtensionController < ApplicationController
  skip_before_action :verify_authenticity_token

  def receiver
    begin
      received_data = params
      client = Client.find_or_create_by!(token_identifier: received_data[:token_identifier])
      client.extension_data.create!(data: received_data[:data])
    rescue StandardError => e
      render json: { message: "Error in extension_controller line 12" }
      return
    end

    render json: { message: "Data processed successfully" }
  end
end
