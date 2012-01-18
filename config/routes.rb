Areequal::Application.routes.draw do

  devise_for :users, :controllers =>{ :omniauth_callbacks => "users/omniauth_callbacks" }

  #devise_for :users do
  #  get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'
  #end

  resources :users 
  resources :arts
  resources :follows
  resources :favorites
  match "/follows/unsubscribe" => "follows#unsubscribe"
  match "/show_favorites" => "users#favorites"
  match "/myart" => "users#myart"
  match "/subscriptions" => "users#subscriptions"
  match "/messages" => "users#messages"
  match "/settings" => "users#settings"
  match "/user_page" => "users#user_page"
  match "/modify_profile" => "users#edit"
  match "/show_user_art" => "users#show_art"

  match "/login" => "users#login" 
  match "/logout" => "users#logout" 
  match "/about" => "landing#about" 
  match "/browse" => "landing#index" 
  match "/blog" => "landing#blog" 
  match "/search/:query" => "arts#search"
  root :to => "landing#index"
end
