Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
  }

  devise_scope :user do
    get 'details/:id/users/sign_up', to: 'devise/registrations#new', as: 'new_user_registration_app'
  end
  resources :users, only: [:show]
  # resources :saved_places, only: [:show] do
  #   get 'delete_saved_place'
  # end

  # devise_scope :user do
  #   root to: "devise/sessions#new"
  # end

  get 'places/oli'
  root to: 'pages#landing'

  resources :details, only: [:new, :create] do
    resources :places, only: [:new, :create]
    resources :users, only: [:new]
  end

  resources :places, except: [:new] do
    resources :saved_places, only: [:create, :destroy]
    resources :users, only: [:show]
    # resources :saved_places, only: [:destroy]
    # get '/saved_places' => 'places#saved_places'
    # get '/delete_saved_places' => 'places#delete_saved_place'
    member do
      put "like", to: "places#upvote"
      put "dislike", to: "places#downvote"
    end
  end

  resources :details, only: [:index]

  get '/static' => 'pages#static'
  get '/notlogin' => 'pages#notlogin'
  get '/alreadylogin' => 'pages#alreadylogin'
  get '/alreadyshared' => 'pages#alreadyshared'
  get '/toomanyshared' => 'pages#toomanyshared'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

# devise_for :users, controllers: { confirmations: "users/confirmations", passwords: "users/passwords", registrations: "users/registrations",
#                                     sessions: "users/sessions", unlocks: "users/unlocks" }
