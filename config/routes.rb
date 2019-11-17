Rails.application.routes.draw do
  get 'home/index'
  get 'sessions/create'
  get 'sessions/destroy'
  resources :offers
  root 'offers#index'
end
