Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  namespace :api do
    namespace :v1 do
      resources :post, only: [:index]

      post :auth, to: 'authentication#create'
      get :auth, to: 'authentication#fetch'
    end
  end
end