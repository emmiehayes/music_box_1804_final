Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'
  get '/logout', to: 'sessions#destroy'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'


  resources :artists, shallow: true do
    resources :songs, except: [:index], param: :slug
  end

  resources :songs, only: [:index]
  resources :awards, only: [:index, :show]

  resources :playlists

  resources :users, only: [:new, :create, :show]

  namespace :admin do
    resources :categories, only: [:index]
    resources :awards, only: [:new, :create]
  end

  resources :carts, only: [:create]
end
