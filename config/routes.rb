Rails.application.routes.draw do
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "techtools#index"

  namespace :company do
    get 'index'
    post 'analyze_company'
  end
end
