Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#index'
  resources :homes, only: [:index]
  get "home/about" => "homes#show"
  resources :users, only: [:show, :index, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get "follows" => "relationships#follows"
    get "followers" => "relationships#followers"
  end

  resources :books do
  	resources :book_comments, only: [:create, :destroy]
  	resources :favorites, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
