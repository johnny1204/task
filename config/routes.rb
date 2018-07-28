Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :session
  resources :images, only: %i[index create new] do
    member do
      get :tweet
    end
  end
  namespace :oauth do
    get :callback
  end
end
