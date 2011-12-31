Areequal::Application.routes.draw do
	resource :users
  root :to => "landing#index"
end
