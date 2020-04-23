Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  scope '(:locale)', locale: /fr|es/ do
    root to: 'pages#home'
    resources :books do
      resources :episodes
      resources :sessions
      resources :reviews, only: :create
    end
    resources :requests
  end
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :books, only: [ :index, :show, :create]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
