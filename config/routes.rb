Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :manufacturers
  resources :subsidiaries
  resources :car_categories
  resources :customers do
    get 'search', on: :collection
  end  
  resources :car_models, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :rentals, only: %i[index new create show edit update destroy] do
    get 'search', on: :collection
  end
  resources :cars, only: %i[index new create show edit update destroy] do 
    get 'search', on: :collection
  end  
  
  
end
