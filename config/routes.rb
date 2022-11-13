Rails.application.routes.draw do
  namespace :user do
    get 'rankings/index'
  end
  namespace :user do
    get 'posts/new'
    get 'posts/index'
    get 'posts/create'
    get 'posts/show'
    get 'posts/update'
    get 'posts/destroy'
  end
  devise_for :admins
  # devise_for :users
      #   t.string :name
      # t.text :introduction
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
