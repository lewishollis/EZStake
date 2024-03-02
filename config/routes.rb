Rails.application.routes.draw do
  devise_for :users
  devise_for :admins

  root to: "pages#home"

  # Add routes for the profiles controller
  resource :profile, only: [:show, :edit, :update]
  resources :sweepstakes, only: [:show, :new, :create]

  # ... other routes if any
end
