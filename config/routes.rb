Rails.application.routes.draw do
  resources :reviews, :locations

  devise_for :users
  # root to: '#'
  # config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }



end
