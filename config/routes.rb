Rails.application.routes.draw do
  get 'bookmarks/create'
  get 'bookmarks/destroy'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  root 'products#index'

  resources :products do
    resources :comments, only: :create
  end
  resources :buyers, only: :index
  resources :mypages, only: [:index, :show] do
    collection do
      get :bookmarks
    end
  end
  resources :mycards, only: [:new, :show]

  resources :products, shallow: true do
    resource :bookmarks, only: %i[create destroy]
    get :bookmarks, on: :collection
  end
end
