Rails.application.routes.draw do
  resources :locations do
    resources :reviews, only: [:new, :create]
  end

  namespace :account do
    resource :profile, only: [:show, :edit, :update]
    resources :reviews, only: [:edit, :update, :destroy]
  end

  resources :messagecontacts, only: [:create]

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

end
