Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  root to: "pages#home"

  # Add routes for the profiles controller
  resource :profile, only: [:show, :edit, :update]
  resources :sweepstakes

  # ... other routes if any
end
