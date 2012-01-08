Areequal::Application.routes.draw do
	resources :users
  resources :arts
  match "/edit_profile" => "users#edit_profile"
  match "/login" => "landing#login" 
  match "/logout" => "landing#logout" 
  match "/about" => "landing#about" 
  match "/browse" => "arts#browse" 
  match "/blog" => "landing#blog" 
  match "/search/:query" => "arts#search"
  root :to => "landing#index"
end
