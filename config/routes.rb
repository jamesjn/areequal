Areequal::Application.routes.draw do
	resources :users
  resources :arts
  match "/login" => "landing#login" 
  match "/logout" => "landing#logout" 
  match "/about" => "landing#about" 
  match "/browse" => "art#browse" 
  root :to => "landing#index"
end
