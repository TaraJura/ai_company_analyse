Rails.application.routes.draw do
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "company#index"

  namespace :company do
    get 'index'
    post 'analyze_company'
  end

  namespace :extension do
    post 'receiver'
  end
end
