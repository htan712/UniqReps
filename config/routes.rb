Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :recipes do
    resources :reviews
  end

  root 'recipes#index'
end
