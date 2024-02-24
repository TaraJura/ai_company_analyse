# frozen_string_literal: true

class ExtensionController < ApplicationController
  skip_before_action :verify_authenticity_token

  def receiver
    puts 'receiver is listening to you'

    render json: { message: "Data processed successfully" }
  end
end
