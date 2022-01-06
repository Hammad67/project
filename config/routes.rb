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
  resources :categories do
    resources :article_categories
  end
  #resources :categories ,only:[:index,:new,:create]
  #get '/categories/:id',to:'categories#show'
  #post '/categories/:id',to:'article_categories#create'
  get '/search', to: 'articles#search'
end
