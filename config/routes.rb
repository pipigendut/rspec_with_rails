Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }

  namespace :api do
    namespace :v1 do
      resources :posts
    end
  end
end