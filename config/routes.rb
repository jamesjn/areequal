Areequal::Application.routes.draw do

  devise_for :users, :controllers =>{ :omniauth_callbacks => "users/omniauth_callbacks" }

  #devise_for :users do
  #  get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'
  #end

	resources :users
  resources :arts
  match "/modify_profile" => "users#edit"
  match "/show_user_art" => "users#show_art"
  match "/login" => "users#login" 
  match "/logout" => "users#logout" 
  match "/about" => "landing#about" 
  match "/browse" => "arts#browse" 
  match "/blog" => "landing#blog" 
  match "/search/:query" => "arts#search"
  root :to => "landing#index"
end
