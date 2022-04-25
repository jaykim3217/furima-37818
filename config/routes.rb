Rails.application.routes.draw do

  devise_for :users
  root to: "items#index"
  resources :users, only: [:new]
  resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy]
end
