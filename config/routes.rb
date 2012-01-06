Areequal::Application.routes.draw do
	resources :users
  resources :arts
  match "/edit_profile" => "users#edit_profile"
  match "/login" => "landing#login" 
  match "/logout" => "landing#logout" 
  match "/about" => "landing#about" 
  match "/browse" => "arts#browse" 
  root :to => "landing#index"
end
