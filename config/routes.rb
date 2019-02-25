Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'

  resources :after_signup, only: [:show, :update]
  resources :events, only: [:show, :create] do
    resources :design, controller: 'events/build'
  end
  resources :users, only: [:show]
end
