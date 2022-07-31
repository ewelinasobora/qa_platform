Rails.application.routes.draw do
  root 'posts#index'
  get 'users/profile'
  get '/u/:id', to: 'users#user_profile', as: 'user'

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :posts do
    resources :comments
  end
end
