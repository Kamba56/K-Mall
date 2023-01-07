Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :stores, only: [:index, :show, :new, :create] do
    resources :items, only: [:new, :create]
  end
  # Defines the root path route ("/")
  root "stores#index"
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
