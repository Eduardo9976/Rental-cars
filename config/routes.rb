Rails.application.routes.draw do
  root 'home#index'
  resources :manufacturers, only: [:index, :show, :new, :create], param: :name
end
