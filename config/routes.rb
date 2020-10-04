Rails.application.routes.draw do
  get 'cards/new'
  get 'users/show'
  devise_for :users
  root to: 'items#index'
  resources :users, only: [:show, :edit, :update]
  resources :cards, only: [:new, :create, :show, :destroy]
  resources :items do
    resources :managements, only: [:index, :create, :new]
  end
end
