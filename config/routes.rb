OmniauthGoogleOauth2Example::Application.routes.draw do

  resources :admins 
  resources :students
  resources :documents
  resources :rooms
  resources :rooms do
  	resources :documents
    resources :chat
    resources :students
  end
  resources :chat

  root to: 'home#index'
  get "home/index"
  match "/auth/google_oauth2/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", as: :signout
  match "/give_access" => "students#give_access", as: :access
  match "/remove_access" => "students#remove_access", as: :remove_access
  match "/auth" => "admins#auth", as: :auth

  faye_server '/faye', timeout: 25 do
    map '/chat/*' => RealtimeChatController
    map default: :block
  end

end
