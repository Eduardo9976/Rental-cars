Rails.application.routes.draw do
  root 'home#index'
  resources :manufacturers
  resources :subsidiaries
  resources :car_categories
  resources :customers  
  resources :car_models, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :rentals, only: %i[index new create show edit update destroy] 
end
