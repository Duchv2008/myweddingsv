Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  scope :api do
    post 'login' => 'sessions#create'
    post 'register' => 'users#create'
    # guest accept join wedding
    post 'guests/accept' => 'guest_accept_join_wedding#create'
    delete 'guests/cancelled' => 'guest_accept_join_wedding#destroy'

    resources :albums
    resources :services
    resources :weddings do
      resources :checklists
      resources :wedding_guests
    end
  end
end
