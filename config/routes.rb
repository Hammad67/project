Rails.application.routes.draw do
  # devise_for :users
    devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }
  root "articles#index"
  resources :articles do
    resources :likes
    resources :comments
  end
  get '/search', to: 'articles#search'
end
