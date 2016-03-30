Rails.application.routes.draw do
  root "movies#index"

  resources :theatres
  resources :movies
end
