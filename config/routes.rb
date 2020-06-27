Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  resources :chatrooms do
    resources :messages, only: :create
  end

  scope '(:locale)', locale: /fr|es/ do
    root to: 'pages#home'
    get 'payment', to: 'pages#payment'
    get 'read', to: 'pages#your_read'
    resources :books do
      resources :episodes do
        resources :sessions
      end
      resources :reviews, only: :create
    end
    resources :requests
  end

  get "account_credit" => "pages#account_credit", as: :account_credit
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :books, only: [ :index, :show, :create]
      resources :users, only: [:index, :show, :update ]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
