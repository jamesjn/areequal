Areequal::Application.routes.draw do
	resource :users
  match "/login" => "landing#login" 
  root :to => "landing#index"
end
