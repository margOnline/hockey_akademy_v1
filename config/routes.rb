Rails.application.routes.draw do
  root 'static_pages#home'
  # match '/signup', to: 'parents#new', via: 'get'
  match '/coach_profiles', to: 'static_pages#coach_profiles', via: 'get'

### Parents ###
  devise_for :parents

  resources :parents do
    resources :players
    resources :camp_registrations
  end

  resources :camps do
    resources :camp_sessions
    resources :locations
  end

  resources :players, :only => [:show] do
    resources :camp_sessions, :through => :camps
    resources :registrations
  end

end
