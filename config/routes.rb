Rails.application.routes.draw do
    root "events#top"
    resources :events
    
    end