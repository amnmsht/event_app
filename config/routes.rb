Rails.application.routes.draw do
    if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
    end
    
   devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  
  
    root "events#top"
    resources :events
    resources :users, :only => [:index, :show]
    resources :users, only: [:show]
    
    end