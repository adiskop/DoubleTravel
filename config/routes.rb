Rails.application.routes.draw do

  get '/signup' => 'users#new'


  resources :visited_gems
  resources :users
  resources :destinations
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
