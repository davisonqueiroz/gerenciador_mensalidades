Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  root "enrollments#index"

  namespace :api do
    namespace :v1 do
        resources :universities, :students, :invoices, :enrollments
    end
    namespace :v2 do
      resources :institutions

      resources :orders, only: [:show] do
        resource :coupon, only: [:create, :new, :show, :edit, :update]
        resource :payment, only: [:create, :new, :show, :edit, :update]
        resource :offer, only: [:show]
      end
      resources :offers do 
        resources :orders, only: [:create,:new, :show, :edit, :update]
        resource :institution, only: [:show]
      end
      resources :subscriptions do
        resources :cycles, shallow: true
        resources :transactions, only: [:new, :create, :show, :update, :edit]
        resource :coupon, only: [:show]
      end
      resources :cycles , only: [:show] do
        resources :transactions, only: [:index, :show, :new, :create, :edit, :update]
      end
      resources :transactions do
        resource :payment, only: [:show, :edit, :update]
      end
      resources :institutions do
        resource :address, only: [:show, :edit, :update]
      end
    end
  end
end
