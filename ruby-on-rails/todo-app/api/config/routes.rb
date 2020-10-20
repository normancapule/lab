Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: 'json' } do
    scope module: :v1 do
      resources :sessions, only: %w[create destroy]
      post '/registrations', to: 'registrations#create'
    end
  end
end
