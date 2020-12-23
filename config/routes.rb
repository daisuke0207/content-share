# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  resources :posts do
    resources :comments, only: [:index, :create]
  end
  resources :users, only: :show do
    collection do
      get 'my_post'
      get 'need_login'
    end
  end
end
