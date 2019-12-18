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

  #routes to RentalsController
  get 'rental', to: 'rentals#rental_form'
  resources :rentals, only: %i(index create destroy)

  #routes to ReservationsController
  resources :reservations, only: %i(index show create destroy)

  #routes to MesController
  get 'me/confirmation', to: 'mes#confirmation'
  resource :me, only: %i(show edit update destroy)

  #routes to ReturnsController
  get '/return/:id', to: 'returns#return_form', as: 'return'
  post '/return/:id', to: 'returns#destroy'
end
