Torutsume::Application.routes.draw do
  resources :texts do
    member do
      post 'comments' => 'comments#create'
    end
  end

  resources :users, only: [:index, :show]

  root to: 'home#index'

  devise_for :users, path: 'account', controllers: { omniauth_callbacks: 'account/omniauth_callbacks' }
end
