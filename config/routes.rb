# frozen_string_literal: true

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: "home#index"
  devise_for :users,
    defaults: { format: :json },
    controllers: {
      sessions: 'sessions',
      registrations: 'registrations'
    }
  resources :users, only: %i[show] do #, defaults: { format: :json }
    resources :contacts
  end
  get 'apidoc', to: 'apidoc#index'
  # match '*path', to: ->(_env) { [404, {}, ['{"error": "not_found"}']] }, via: :all
end
