# frozen_string_literal: true

class VerificationController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    puts 'Hello'
  end
end
