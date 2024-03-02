Rails.application.routes.draw do
  devise_for :users
  devise_for :admins

  root to: "pages#home"

  # Add routes for the profiles controller
  resource :profile, only: [:show, :edit, :update]
  resources :sweepstakes, only: [:show, :new, :create]

  # Routes for SweepstakesUsersController
  resources :sweepstake_users, only: [] do
    member do
      post 'add_user'
      delete 'remove_user'
    end
  end

  # ... other routes if any
end
