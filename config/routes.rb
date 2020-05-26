Rails.application.routes.draw do
  root 'books#top'
  get '/home/about' => 'books#about'
  devise_for :users
  
  resources :books, only: [:top,:new, :create, :index, :show,:edit,:update,:destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :index, :show,:edit,:update]
end
