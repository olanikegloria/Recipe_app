Rails.application.routes.draw do
  devise_for :users
  root "home#index"

  resources :foods
  resources :recipe_foods

  resources :recipes, except: :edit do
    member do
      patch 'toggle_public'
    end
    resources :recipe_foods, only: %i[new create destroy]
  end 

  resources :shopping_lists, only: [:index] do
    get :generate, on: :collection
  end

end
