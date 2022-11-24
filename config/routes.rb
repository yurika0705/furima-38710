Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'

  
  resources :scheduled_deliverys
  resources :prefectures
  resources :shipping_free_status
  resources :categorys
  resources :sales_status
  resources :items, only: [:index, :new, :create]
  
end
