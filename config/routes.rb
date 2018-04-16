Rails.application.routes.draw do
  resources :kinds
  resources :contacts do
    resource :kind, only: [:show]
    resource :kind, only: [:show], path: 'relationships/kind'

    resources :phones, only: [:index]
    resources :phones, only: [:index], path: 'relationships/phones'

    resource :address, only: [:show]
    resource :address, only: [:show], path: 'relationships/address'
  end
end
