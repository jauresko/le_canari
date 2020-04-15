Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :books do
    resources :sessions
    resources :reviews, only: :create
  end
  resources :requests
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
