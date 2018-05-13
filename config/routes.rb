Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  resources :kinds

  resources :auths, only: [:create]

  api_version(module: 'V1', path: { value: 'v1' }) do
  # constraints subdomain: 'v1' do
  #   scope module: 'v1' do
      resources :contacts do
        resource :kind, only: [:show]
        resource :kind, only: [:show], path: 'relationships/kind'

        resource :phones, only: [:show]
        resource :phones, only: [:show], path: 'relationships/phones'
        resource :phone, only: %i[update create destroy]
        resource :phone, only: %i[update create destroy], path: 'relationships/phones'

        resource :address, only: %i[show update create destroy]
        resource :address, only: %i[show update create destroy], path: 'relationships/address'
      end
    # end
  end

  api_version(module: 'V2', path: { value: 'v2' }) do
  # constraints subdomain: 'v2' do
  #   scope module: 'v2' do
      resources :contacts do
        resource :kind, only: [:show]
        resource :kind, only: [:show], path: 'relationships/kind'

        resource :phones, only: [:show]
        resource :phones, only: [:show], path: 'relationships/phones'
        resource :phone, only: %i[update create destroy]
        resource :phone, only: %i[update create destroy], path: 'relationships/phones'

        resource :address, only: %i[show update create destroy]
        resource :address, only: %i[show update create destroy], path: 'relationships/address'
      end
    # end
  end

  post 'orders', to: 'orders#create'
end
