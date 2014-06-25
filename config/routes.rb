Rails.application.routes.draw do
  root 'static_pages#home'
  # match '/signup', to: 'parents#new', via: 'get'
  match '/coach_profiles', to: 'static_pages#coach_profiles', via: 'get'
  match '/registration', to: 'static_pages#register', via: 'get'

### Parents ###
  devise_for :parents

  resources :parents, :only => [:show] do
    resources :players, :only => [:new, :create]
  end

  resources :camps do
    resources :camp_sessions
    resources :locations
  end

  resources :players do
    resources :camp_sessions, :through => :camps
  end
end
