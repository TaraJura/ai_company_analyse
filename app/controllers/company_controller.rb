# frozen_string_literal: true

class CompanyController < ApplicationController
  def index
  end

  def analyze_company
    analysed_data = Ares.new.ai_analysed_data(params[:ico])
    Company.create!(ico: params[:ico], ai_analysed_data: analysed_data)

    render plain: analysed_data
  end
end
