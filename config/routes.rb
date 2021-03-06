Rails.application.routes.draw do
  devise_for :users

  root to: "splash#index"

  resources :groups, only: [:index, :show, :new, :create, :destroy] do
    resources :payments, only: [:index, :show, :new, :create]
  end

end
