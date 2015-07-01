Rails.application.routes.draw do
  resources :locations do
    resources :reviews, only: [:new, :create]
  end

  namespace :account do
    resource :profile, only: [:show, :edit, :update]
    resources :reviews, only: [:edit, :update, :destroy]
  end

  devise_for :users
end
