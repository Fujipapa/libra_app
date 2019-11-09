Rails.application.routes.draw do

  #routes to HomeController
  get 'rental/search'

  get 'rental/detail'

  get 'rental/rental_form'

  root 'home#top'

  #routes to UsersController
  resources :Users
end
