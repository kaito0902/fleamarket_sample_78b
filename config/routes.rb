Rails.application.routes.draw do
  root 'products#index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :products, only: [:index, :show, :new]
  resources :buyers, only: :index do
    collection do
      get 'index', to: 'buyers#index'
    end
  end
end
