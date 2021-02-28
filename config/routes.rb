Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  namespace :api, defaults: { formats: :json } do
    namespace :v1 do
      resources :users
      resources :company_unities
      resources :companies
      resources :businesses
      resources :outgoings
      resources :incomings
      resources :cash_accounts
      resources :bank_accounts
      post 'make_account', to: 'cash_accounts#make_account'

      get 'dashboard', to: 'dashboard#index'
      get 'review_cash_account', to: 'cash_accounts#review_current_accounting'
    end

    post '/user/current_company_unity/:unity_id', to: 'api#set_current_user_unity'
  end

  mount RailsAdmin::Engine => '/adm', as: 'rails_admin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
