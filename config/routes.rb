Rails.application.routes.draw do
  namespace :app do
    namespace :controllers do
      namespace :api do
        namespace :v1 do
          get 'test/index'
          get 'test/show'
        end
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
