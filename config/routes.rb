Rails.application.routes.draw do
  get 'tags/show'

  get 'relationships/create'

  get 'relationships/destroy'

  root to: "static_pages#home"

  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }

  resources :users do
    member do
      get :following, :followers
    end
  end

  devise_scope :user do
    get "/signup", to: "users/registrations#new"
    post "/signup", to: "users/registrations#new"
    get "/login", to: "users/sessions#new"
    post "/login", to: "users/sessions#create"
    delete "/logout", to: "user/sessions#destroy"
  end

  resources :posts, except: :new do
    resources :comments, only: [:edit, :update, :create, :destroy]
  end
  resources :tags, only: [:create, :show]
  resources :relationships, only: [:create, :destroy]
  resources :users, only: [:index, :show, :new, :create]
end
