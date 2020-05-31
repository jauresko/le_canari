Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  scope '(:locale)', locale: /fr|es/ do
    root to: 'pages#home'
    get 'payment', to: 'pages#payment'
    resources :books do
      resources :episodes do
        resources :sessions
      end
      resources :reviews, only: :create
    end
    resources :requests
  end
  get "checkout" => "pages#checkout", :as => :checkout
  post "request_charge" => "pages#request_charge", :as => :request_charge
  post "perform_charge" => "pages#perform_charge", :as => :perform_charge
  post "confirmation" => "pages#confirmation", :as => :confirmation
  get "account_credit" => "pages#account_credit", as: :account_credit
  get "receipt" => "pages#receipt", as: :receipt
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :books, only: [ :index, :show, :create]
      resources :users, only: [:index, :show, :update ]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
