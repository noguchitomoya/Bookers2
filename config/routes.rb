Rails.application.routes.draw do
  root 'book#index'
  devise_for :users
  
  resources :books, only: [:new, :create, :index, :show,:edit,:update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :index, :show,:edit,:update]
end