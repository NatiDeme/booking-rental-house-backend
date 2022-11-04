Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  get 'tours' => 'tour#index'
  post 'tours' => 'tour#create'
  get 'tours/:id' => 'tour#show'
  get 'user_reservations' => 'reservation#index'
  get 'user_reservations/:id' => 'reservation#show'
  delete 'user_reservations/:id' => 'reservation#destroy'
  delete 'tours/:id' => 'tour#destroy'
  post '/login' => 'authentication#login'
  post '/signup' => 'users#create'
  post '/reserve' => 'reservation#create'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
