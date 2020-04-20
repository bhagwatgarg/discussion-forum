Rails.application.routes.draw do
	root "users#index"
	get "/edit_profile" => "users#edit", as:"edit_profile"
	get "/view_profile" => "users#show", as: "view_profile"
	post "/create_user" => "users#create", as: "create_user"
	post "/update_user" => "users#update", as: "update_user"
	delete "/delete_user" => "users#destroy", as: "destroy_user"
	get "/find_users" => "users#find", as: "find_user"
	get "/ext_profile" => "users#extprofile", as: "ext_profile"
	get "/follow_user" => "users#follow_user", as: "follow_user"
	
	resources :users, only: [:new]


	resources :userposts, only: [:new]
	get "/edit_post" => "userposts#edit", as:"edit_post"
	get "/view_post" => "userposts#show", as: "view_post"
	post "/create_post" => "userposts#create", as: "create_post"
	post "/update_post" => "userposts#update", as: "update_post"
	delete "/delete_post" => "userposts#destroy", as: "destroy_post"
	

	get "/login" => "sessions#new", as: "login"
	delete "/logout" => "sessions#destroy", as: "logout"
	get "/login_create" => "sessions#create", as: "create_session"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
