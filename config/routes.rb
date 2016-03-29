Rails.application.routes.draw do
  resources :theatres, except: [:index]
end
