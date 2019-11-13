Rails.application.routes.draw do

  root 'home#top'
  
  #routes to UserController
  resources :users

  #routes to LoginController
  get '/login', to: 'login#login_form'
  resources :login, only: %i(create)
end
