# frozen_string_literal: true

Rails.application.routes.draw do
  resources :categories do
    resources :posts do
      resources :comments
    end
  end
  get 'my_posts', to: 'posts#my_posts'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  resources :sessions, only: %i[create destroy]
  resource :home, only: [:show]
  root to: 'categories#index'
end
