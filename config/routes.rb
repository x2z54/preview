OmniauthGoogleOauth2Example::Application.routes.draw do

  resources :documents
  resources :rooms
  resources :rooms do
  	resources :documents
  end
  resources :chat

  root to: 'home#index'
  get "home/index"
  match "/auth/google_oauth2/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", as: :signout

  faye_server '/faye', timeout: 25 do
    map '/chat' => RealtimeChatController
    map default: :block
  end

end
