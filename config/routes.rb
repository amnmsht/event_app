Rails.application.routes.draw do
    if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
    end
    
   devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  
  
    root "events#top"
    resources :events, shallow: true do
      resources :entries, only: [:create, :destroy]
      
    #resources :users, :only => [:index, :show]
    resources :users, only: [:show]
    resources :favorites, only: [:create, :destroy]
    
    end
  end