Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'galaxies', to: 'galaxies#index'
  # get 'galaxies/:id', to: 'galaxies#show'

  resources :galaxies, only: [ :index, :show ] do
    resources :rents, only: [ :new, :create ]
  end
  resources :rents, only: [ :index, :show, :edit, :update, :destroy ]

end
