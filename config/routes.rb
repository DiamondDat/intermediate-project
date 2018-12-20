Rails.application.routes.draw do
  root to: 'pages#index'
  devise_for :users, :controllers => {:registrations => "registrations"}
  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
    get 'login',  to: 'devise/sessions#new'
  end

  resources :posts do
    collection do
      get 'hobby'
      get 'study'
      get 'team'
    end
  end

  namespace :private do
    resources :conversations, only: [:create] do
      member do
        post :close
        post :open
      end
    end
    resources :messages, only: [:index, :create]
  end
end
