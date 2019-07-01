Rails.application.routes.draw do
  devise_for :users
  resources :categories
  resources :ads do
    collection do
      get 'homepage'
      post 'homepage'
    end
end
root 'ads#homepage'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
