Torutsume::Application.routes.draw do
  root to: 'home#index'

  devise_for :users, path: 'account', controllers: { omniauth_callbacks: 'account/omniauth_callbacks' }
end
