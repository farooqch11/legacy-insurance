Rails.application.routes.draw do

  match '/calculate_amount' => 'legacies#calculate_amount', via: :post

  # get 'planner/index'
  # resources :blogs
  # resources :posts
  # get 'welcome/index'
  # resources :policies

  root 'welcome#index'
  devise_for :users
  resources :legacies


end
