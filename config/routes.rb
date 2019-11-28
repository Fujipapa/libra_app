Rails.application.routes.draw do

  root 'home#top'
  
  #routes to UserController
  resources :users

  #routes to LoginController
  get '/login', to: 'login#login_form'
  post '/login', to: 'login#create'

  #routes to LogoutController
  delete '/logout', to: 'logout#destroy'

  #routes to BooksController
  resources :books
end
