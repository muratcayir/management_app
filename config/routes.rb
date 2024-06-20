Rails.application.routes.draw do
  resources :users, param: :username, only: %i[index edit update] do
    collection do
      get 'search'
    end
  end

  resources :albums, only: %i[index show]

  root 'users#index'
end
