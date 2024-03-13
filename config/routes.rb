Rails.application.routes.draw do
  get 'home/index'
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  resources :products
  root 'products#index'
  get "up" => "rails/health#show", as: :rails_health_check

end
