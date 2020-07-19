Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end


  root 'products#index'

  resources :products
  resources :buyers
  post 'purchase', to: 'buyers#purchase'
  resources :mypages, only: [:index, :show]
  resources :credit_cards, only: [:new, :show, :create, :destroy, :index] do
    collection do
      post 'create', to: 'credit_cards#create'
      post 'purchase', to: 'credit_cards#purchase'
      post 'delete', to: 'credit_cards#delete'
    end
  end
end