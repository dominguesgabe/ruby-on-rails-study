Rails.application.routes.draw do
	resources :rooms
	resources :users

	root :to => "home#index"
end
