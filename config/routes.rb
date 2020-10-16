Rails.application.routes.draw do
  devise_for :users, module: 'users', skip: :sessions
  devise_for :users, module: 'users', path: '', path_names: { sign_in: 'login', sign_out: 'logout' }, only: :sessions
  resources :posts, except: %i[edit update] do
    resources :post_reviews, only: %i[index create destroy] do
      resources :post_review_comments, only: %i[index create destroy]
      resource :post_review_likes, only: %i[create destroy]
    end
  end

  get 'privacy', to: 'high_voltage/pages#show', id: 'privacy'
  get 'terms', to: 'high_voltage/pages#show', id: 'terms'

  root 'home#index'

  unless Rails.env.development?
    get '*unmatched_route', to: 'application#route_not_found'
  end
end
