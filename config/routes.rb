Rails.application.routes.draw do
  get 'offers/apply', to: 'offers#apply'
  get 'offers/my_offers', to: 'offers#my_offers'
  
  devise_for :users, :controllers => {
  :registrations => 'users/registrations',
  :sessions => 'users/sessions'   
  } 

  devise_scope :user do
    get "user/:id", :to => "users/registrations#detail"
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
  end
  
  resources :offers
  root 'home#index'
  resources :offers do
    post :confirm, action: :confirm_new, on: :new
  end
end