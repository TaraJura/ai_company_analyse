# frozen_string_literal: true

class CompanyController < ApplicationController
  def index
  end

  def analyze
    Company.create(ico: params[:ico])
    analysed_data = Ares.ai_analysed_data('06370772')
    
    render plain: analysed_data
  end
end
