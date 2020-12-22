# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  resources :posts
  resources :users, only: :show do
    collection do
      get 'my_post'
    end
  end
end
