Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'registrations'
  }
  root to: 'statics#home'
  get '/:shorter_url', to: 'links#show', as: :short

  namespace :user do
    resources :links
  end

  # API
  scope module: 'api' do
    namespace :v1 do
      resources :links, only: %i[create index]
    end
  end
end
