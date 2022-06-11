Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'registrations'
  }
  root to: 'statics#home'
  namespace :user do
    resources :links
  end
  get '/:shorter_url', to: 'links#show', as: :short
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
