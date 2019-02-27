Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'

  resources :after_signup, only: [:show, :update]
  resources :events, only: [:show, :create] do
    resources :design, controller: 'events/build'
  end
  resources :users, only: [:show]

  resources :speeches, only: [:index, :show] do
    resources :contributions, only: :create
  end
end
