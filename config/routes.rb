Rails.application.routes.draw do
  devise_for :users
  root 'users#show'
  resources :homes, only: [:index]
  get "about" => "homes#show"
  resources :users, only: [:show, :index, :edit]
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
