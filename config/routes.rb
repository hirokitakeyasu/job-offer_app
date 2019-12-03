Rails.application.routes.draw do
  post 'likes/:post_id/create', to: 'likes#create'
  post 'likes/:post_id/destroy', to: 'likes#destroy'
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
end