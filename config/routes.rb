Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show]
      resources :courses, only: [:index, :show]
      resources :lessons, only: [:index, :show]
    end

    namespace :v2 do
      resources :users, only: [:index, :show] do
        resources :courses, only: [:index, :show] do
          resources :lessons, only: [:index, :show]
        end
      end
    end
  end
end
