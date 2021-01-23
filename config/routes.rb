Rails.application.routes.draw do
  devise_for :users, path: '',
             path_names: { sign_in: 'login', sign_out: 'logout' },
             controllers: { sessions: 'users/sessions' }

  namespace :api, defaults: { formats: :json } do
    namespace :v1 do
      resources :users
      resources :business_substores
      resources :businesses
    end
  end

  mount RailsAdmin::Engine => '/adm', as: 'rails_admin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
