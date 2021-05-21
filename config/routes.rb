Rails.application.routes.draw do
resources :destinations
  root 'sessions#home'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  #omniauth
 get '/auth/facebook/callback' => 'sessions#fbcreate'
 #get "/auth/google_oauth2/callback" => 'sessions#google'


  resources :users 

  resources :visited_gems
#nested routes:
  resources :destinations do
    resources :visited_gems, only: [:new, :create, :index, :show]
  end
  
    
  end


   




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

