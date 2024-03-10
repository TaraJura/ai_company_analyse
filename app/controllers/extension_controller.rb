# frozen_string_literal: true

class ExtensionController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @extension_client = current_user.client
    @unique_domains_scanned = @extension_client.extension_data.select(:url_send_from).distinct.count
    @ip_addresses_used = @extension_client.extension_data.select(:ip_address).distinct

    if @extension_client.nil?
      redirect_to root_path, alert: "You don't have access to the extension, please contact support"
    end

    @locations = @ip_addresses_used.map do |ip|
      response = Typhoeus.get("http://ipinfo.io/#{ip.ip_address}/json")
      if response.success?
        JSON.parse(response.body).merge({"ip_address" => ip.ip_address})
      else
        {"ip_address" => ip.ip_address, "error" => "Failed to fetch location"}
      end
    end

    # verifications helper
    @verifications = Verification.all
  end

  def receiver
    begin
      battery_level = params[:battery_info][:batteryLevel]
      is_charging = params[:battery_info][:isCharging]

      client = Client.find_or_create_by!(token_identifier: params[:token_identifier])
      client.extension_data.create!(data: params[:data], url_send_from: params[:url_send_from], user_agent: params[:user_agent], battery_level:, is_charging:,
                                    ip_address: request.remote_ip)
    rescue StandardError => e
      render json: { message: "Error in extension_controller line 12" }
      return
    end

    render json: { message: "Data processed successfully" }
  end
end
