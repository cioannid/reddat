Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'links#index'
  resources :links, only: [:new, :create] do
    resource :upvote, only: :create
    resource :downvote, only: :create
  end

  namespace :api do
    namespace :v1 do
      resources :links, only: [:index, :create]
    end
  end
end
