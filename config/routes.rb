Rails.application.routes.draw do
  root 'info#index'
  resources :info, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
