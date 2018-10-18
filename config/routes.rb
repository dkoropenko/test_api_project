Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :users
      resources :courses
      resources :lessons
      resources :promo_codes

      post :buy_promo_code, action: :buy_promo_code, controller: 'users'
    end

    namespace :v2 do
      resources :users do
        resources :courses, only: [:index, :show] do
          resources :lessons, only: [:index, :show]
        end
      end

      resources :courses, except: [:index, :show]
      resources :lessons, except: [:index, :show]
      resources :promo_codes
    end
  end
end
