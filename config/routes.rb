Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, module: 'users', skip: :sessions
  devise_for :users, module: 'users', path: '', path_names: { sign_in: 'login', sign_out: 'logout' }, only: :sessions
end
