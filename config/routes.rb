Rails.application.routes.draw do
  get 'bookmarks/new'
  get 'bookmarks/create'
  get 'bookmarks/destroy'

  # Routes de health check
  get "up" => "rails/health#show", as: :rails_health_check

  # Définition de la racine
  root to: "lists#index"
  resources :lists, except: [:index, :edit, :update] do
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: :destroy
  resources :movies, only: [:index, :show] do
    resources :reviews
  end
end
