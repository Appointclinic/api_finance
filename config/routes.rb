Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :business_substores
  resources :businesses
  mount RailsAdmin::Engine => '/adm', as: 'rails_admin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
