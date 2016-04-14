Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, only: [:show]
  resources :recipes do
    member do
      get "like", to: "recipes#upvote"
      get "dislike", to: "recipes#downvote"
    end
    resources :reviews
  end

  root 'recipes#index'
end
