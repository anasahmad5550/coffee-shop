# frozen_string_literal: true


Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
                                sign_in: 'login',
                                sign_out: 'logout',
                                registration: 'signup'
                              },
                    controllers: {
                      sessions: 'sessions',
                      registrations: 'registrations'
                    }

  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :orders, only: %i[index show destroy create]
      resources :items, only: %i[index]
    end
  end
end
