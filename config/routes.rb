Rails.application.routes.draw do
  devise_for :users
  root to: 'albums#index'
  resources :albums do
    resources :stamps do
      collection do
        get 'search'
      end
    end
  end
end
