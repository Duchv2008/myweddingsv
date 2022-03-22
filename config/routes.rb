Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post 'login' => 'sessions#create'
  post 'register' => 'users#create'

  # wedding
  post 'weddings' => 'weddings#create'
  post 'weddings/:id' => 'weddings#update'
  delete 'weddings/:id' => 'weddings#destroy'
  get 'weddings/:id' => 'weddings#show'

  # wedding guest
  get 'wedding_guests' => 'wedding_guests#index'
  post 'wedding_guests' => 'wedding_guests#create'
  post 'wedding_guests/:id' => 'wedding_guests#update'
  delete 'wedding_guests/:id' => 'wedding_guests#destroy'
  get 'wedding_guests/:id' => 'wedding_guests#show'

  # album wedding
  get 'albums' => 'albums#index'
  post 'albums' => 'albums#create'
  post 'albums/:id' => 'albums#update'
  delete 'albums/:id' => 'albums#destroy'
  get 'albums/:id' => 'weddings#show'
end
