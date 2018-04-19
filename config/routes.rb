Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }

  resources :users, only: [:show]
  # resources :saved_places, only: [:show] do
  #   get 'delete_saved_place'
  # end

  devise_scope :user do
    root to: "devise/sessions#new"
  end

  resources :places do
    resources :details, only: [:new, :create]
    resources :users, only: [:show]
    # resources :saved_places, only: [:destroy]
    get '/saved_places' => 'places#saved_places'
    get '/delete_saved_places' => 'places#delete_saved_place'
    member do
      put "like", to: "places#upvote"
      put "dislike", to: "places#downvote"
    end
  end

  resources :details, only: [:index]

  get '/static' => 'pages#static'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

# devise_for :users, controllers: { confirmations: "users/confirmations", passwords: "users/passwords", registrations: "users/registrations",
#                                     sessions: "users/sessions", unlocks: "users/unlocks" }
