# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  resources :posts, only: %i[index new create show edit update] do
    collection do
      get 'my_post'
    end
  end
  resources :users, only: :show
end
