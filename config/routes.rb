Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'
  resources :static_pages do
    resources :comments, only: :create
    resources :photos, only: :create
  end
  resources :users, only: :show
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
