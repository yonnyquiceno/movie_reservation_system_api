Rails.application.routes.draw do
  namespace :v1, :defaults => { :format => :json } do
    resources :reservations, only: :index
    resources :users, only: :create
    resources :movies, only: [:index, :create]
  end
end