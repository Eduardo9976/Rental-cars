Rails.application.routes.draw do
  root 'home#index'
  resources :manufacturers, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :subsidiaries, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :carcategories, only: [:index, :new, :create, :show]  
end
