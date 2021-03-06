Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :tours do

    resources :bookings, only: [:new, :create]
    resources :reviews, only: :create
  end
  resources :bookings, only: [:destroy, :index, :update]
  get 'user/:id/tours', to: 'tours#personal_index', as: :ptours
  resources :users, only: [:show]
  # get 'user/bo', to: 'bookings#index', as: :ibookings
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
