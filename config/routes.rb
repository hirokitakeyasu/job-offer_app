# frozen_string_literal: true

Rails.application.routes.draw do
  get 'favorites/favorites_offers', to: 'favorites#index'
  get 'offers/my_offers', to: 'offers#my_offers'

  resources :offers do
    resource :favorites, only: %i[index create destroy]
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get 'user/:id', to: 'users/registrations#detail'
    get 'signup', to: 'users/registrations#new'
    get 'login', to: 'users/sessions#new'
    get 'logout', to: 'users/sessions#destroy'
  end

  resources :offers
  root 'home#index'
end
