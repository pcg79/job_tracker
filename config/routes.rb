Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'jobs#index'

  resources :jobs, except: [:show]
  resources :companies, except: [:show]
end
