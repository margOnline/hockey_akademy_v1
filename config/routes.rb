Rails.application.routes.draw do
  root 'static_pages#home'
  # match '/signup', to: 'parents#new', via: 'get'
  match '/coach_profiles', to: 'static_pages#coach_profiles', via: 'get'

### Parents ###
  devise_for :parents
  resources :camps do
    resources :campSessions
    resources :locations
  end

end
