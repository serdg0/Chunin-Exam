Rails.application.routes.draw do
  resources :domains, only: [:new, :create, :index, :show]
  get ':short_subdomain', to: 'domains#redirect'
  root to: 'domains#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
