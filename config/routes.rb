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
    get 'start', on: :member
    #post 'start', on: :member, to: 'rentals#confirm' -> trocamos pelo car_rentals create
  end
  resources :cars, only: %i[index new create show edit update destroy] do 
    get 'search', on: :collection
  end
  resources :car_rentals, only: [:create]  do
    get 'end', on: :member
  end
  #get 'api/v1/cars', to: 'api#cars'
  namespace :api, defaults: {format: :json } do
    namespace :v1 do
      resources :cars, only: %i[index show]
    end
  end    
end
