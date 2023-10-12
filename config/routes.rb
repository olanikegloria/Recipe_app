Rails.application.routes.draw do
  devise_for :users
  root "home#index"


  get '/sign_out', to: 'users#sign_out', as: 'sign_out'

  resources :recipes

  # resources :users, only: [:index, :show] do
  #   resources :recipes, only: [:index, :show, :new, :create]
  # end
end