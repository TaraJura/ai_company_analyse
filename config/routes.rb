Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "company#index"
  post '/analyze_company', to: 'company#analyze'

end
