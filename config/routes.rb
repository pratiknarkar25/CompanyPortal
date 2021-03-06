# frozen_string_literal: true

Rails.application.routes.draw do
  resources :categories do
    resources :posts do
      resources :comments
      match 'photos/:id', to: 'posts#delete_photo', via: :delete,
                          as: 'delete_photo'
    end
    get 'posts/:id/deactivate', to: 'posts#deactivate',
                                as: 'post_deactivate'
  end
  get 'my_posts', to: 'posts#my_posts'
  post 'search', to: 'posts#search'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  resources :sessions, only: %i[create destroy]
  resource :home, only: [:show]
  root to: 'categories#index'
end
