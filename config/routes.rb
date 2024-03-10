Rails.application.routes.draw do
  root "company#index"

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
end
