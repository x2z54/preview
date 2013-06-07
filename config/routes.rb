OmniauthGoogleOauth2Example::Application.routes.draw do
  resources :rooms


  get "home/index"
  root :to => 'home#index'
  match "/auth/google_oauth2/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout
end
