Areequal::Application.routes.draw do
	resources :users
  resources :arts
  match "/login" => "landing#login" 
  root :to => "landing#index"
end
