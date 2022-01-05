Rails.application.routes.draw do
  # devise_for :users
    devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }
  root "articles#index"
  resources :articles do
    resources :article_categories
    resources :likes
    resources :comments
  end
  resources :categories
  get '/search', to: 'articles#search'
end
