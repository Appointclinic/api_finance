Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  namespace :api, defaults: { formats: :json } do
    namespace :v1 do
      resources :users
      resources :company_unities
      resources :businesses
      resources :outgoings
      resources :incomings
      resources :cash_accounts
      resources :bank_accounts
      post 'make_account', to: 'cash_accounts#make_account'
    end
  end

  mount RailsAdmin::Engine => '/adm', as: 'rails_admin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
