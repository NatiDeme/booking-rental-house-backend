Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # devise_for :users,
  #            controllers: {
  #              sessions: 'users/sessions',
  #              registrations: 'users/registrations'
  #            }
  # get '/member-data', to: 'members#show'
  get 'tours' => 'tour#index'
  post 'tours' => 'tour#create'
  get 'tours/:id' => 'tour#show'
  get 'user_reservations' => 'reservation#index'
  get 'user_reservations/:id' => 'reservation#show'
  delete 'user_reservation' => 'reservation#destroy'
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
