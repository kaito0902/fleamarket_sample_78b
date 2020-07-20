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
    collection do
      get 'search'
    end
    resources :buyers, only: :index do
      collection do
        get 'index', to: 'buyers#index'
        post 'purchase', to: 'buyers#purchase'
      end
    end
  end
  resources :mypages, only: [:index, :show] do
    collection do
      get :bookmarks
    end
  end
  resources :credit_cards, only: [:new, :show, :create, :destroy, :index] do
    collection do
      post 'create', to: 'credit_cards#create'
      post 'purchase', to: 'credit_cards#purchase'
      post 'delete', to: 'credit_cards#delete'
    end
  end
  resources :products, shallow: true do
    resource :bookmarks, only: %i[create destroy]
    get :bookmarks, on: :collection
  end
end
