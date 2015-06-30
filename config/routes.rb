Rails.application.routes.draw do
  resources :locations do
    resources :reviews
  end

  devise_for :users
  # root to: '#'
  # config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
end
