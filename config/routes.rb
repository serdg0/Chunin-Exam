Rails.application.routes.draw do
  resources :urls, only: [:new, :create, :show]
  get ':short_url', to: 'urls#redirect'
  root to: 'urls#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
