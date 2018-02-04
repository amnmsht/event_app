Rails.application.routes.draw do
  devise_for :users
    root "events#top"
    resources :events
    resources :users, :only => [:index, :show]
    resources :users, only: [:show]
    
    end