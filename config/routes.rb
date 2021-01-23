Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  namespace :api, defaults: { formats: :json } do
    namespace :v1 do
      authenticated :user do        
        resources :users
        resources :business_substores
        resources :businesses
      end
    end
  end

  mount RailsAdmin::Engine => '/adm', as: 'rails_admin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
