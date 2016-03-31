Rails.application.routes.draw do
  get 'showtimes/index'

  get 'showtimes/new'

  get 'orders/index'

  get 'orders/new'

  root "movies#index"

  resources :theatres
  resources :movies do
    resources :showtimes
    resources :orders
  end
  resources :orders
  resources :showtimes
end
