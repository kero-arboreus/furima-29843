Rails.application.routes.draw do
  get 'cards/new'
  get 'users/show'
  devise_for :users
  root to: 'items#index'
  resources :users, only: [:show, :edit, :update]
  resources :cards, only: [:new, :create, :show, :destroy]
  resources :items do
    resources :comments, only: :create
    resources :managements, only: [:index, :create, :new]
    collection do
      get 'search'
    end
  end
end
