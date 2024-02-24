# frozen_string_literal: true

class CompanyController < ApplicationController
  def index
  end

  def analyze_company
    Company.create(ico: params[:ico])
    analysed_data = Ares.new.ai_analysed_data(params[:ico])

    render plain: analysed_data
  end
end
