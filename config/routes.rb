Rails.application.routes.draw do
  # devise_for :users,
  #            controllers: {
  #              sessions: 'users/sessions',
  #              registrations: 'users/registrations'
  #            }
  # get '/member-data', to: 'members#show'
  get 'tours' => 'tour#index'
  post 'tours' => 'tour#create'
  delete 'tour/delete' => 'tour#destroy'
  post '/login' => 'authentication#login'
  post '/signup' => 'users#create'
  post '/reserve' => 'reservation#create'
  # resources :tours
  # resources :users
  # resources :authentication
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
