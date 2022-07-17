Rails.application.routes.draw do

	resources :rooms
	resources :users
	
	resource :user_confirmation, :only => [:show]

	root :to => "home#index"
end
