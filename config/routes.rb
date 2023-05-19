Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :articles do
        resources :comments, shallow: true
        get 'page/', to: 'articles#page', on: :collection
      end
    end
  end
end
