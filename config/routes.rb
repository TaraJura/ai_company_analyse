Rails.application.routes.draw do
  root "verification#index"

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  namespace :company do
    get 'index'
    post 'analyze_company'
  end

  namespace :extension do
    post 'receiver'
    get 'index'
  end

  namespace :verification do
    get 'index'
    post 'receive_verification'
    get 'mobile'
  end
end
