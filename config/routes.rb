Rails.application.routes.draw do
  get 'showtimes/index'

  get 'showtimes/new'

  get 'orders/index'

  get 'orders/new'

  root "movies#index"

  resources :movies, only: [:index, :show] do
    resources :showtimes
    resources :orders, only: [:new, :create]
  end
  resources :showtimes

  namespace :admin do
    resources :orders,    only: [:index]
    resources :movies,    only: [:index, :new, :create, :destroy]
    resources :theatres,  only: [:index, :new, :create, :edit, :update, :destroy]
    resource  :dashboard, only: [:show], controller: :dashboard
  end
end
