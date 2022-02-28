Rails.application.routes.draw do
	namespace :api do
		namespace :v1 do
			post 'authenticate', to: 'authentication#authenticate'
			resources :items, only: %i[index create update destroy]
			get '/items/test' => 'items#test'
		end
	end
end
# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
# Defines the root path route ("/")
# root "articles#index"
