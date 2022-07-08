Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'lists#index'
  get "profile", to: "pages#profile"
  resources :lists, except: [:edit, :update] do
    resources :bookmarks, only: [:new, :create]
    resources :reviews, only: :create
  end
  resources :lists, only: :show do
    member do
      post 'toggle_favorite', to: "lists#toggle_favorite"
    end
    resources :movies, only: [:index, :show] do
      member do
        post 'toggle_favorite', to: "movies#toggle_favorite"
      end
    end
  end
  resources :bookmarks, only: :destroy
  resources :reviews, only: :destroy
end
