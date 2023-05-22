Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :articles do
        resources :comments, shallow: true do
          get 'page/', to: 'comments#page', on: :collection
          get 'search/', to: 'comments#search', on: :collection
        end
        get 'page/', to: 'articles#page', on: :collection
        get 'search/', to: 'articles#search', on: :collection
      end
    end
  end
end
