OmniauthGoogleOauth2Example::Application.routes.draw do
  resources :documents 
  resources :rooms
  resources :rooms do
  	resources :documents
  end

  get "home/index"
  root :to => 'home#index'
  match "/auth/google_oauth2/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout

end
