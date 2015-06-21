Rails.application.routes.draw do
  resources :photos
  resources :albums
  get 'home/index'
  devise_for :users
  root to: "home#index"
end
