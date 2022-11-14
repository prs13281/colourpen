Rails.application.routes.draw do
  namespace :admin do
    get 'posts/edit'
    get 'posts/update'
  end
  namespace :admin do
    get 'comments/index'
    get 'comments/show'
    get 'comments/edit'
    get 'comments/update'
  end
  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
    get 'users/update'
  end
  namespace :user do
    get 'tags/new'
    get 'tags/create'
    get 'tags/destroy'
  end
  namespace :user do
    get 'relationships/index'
    get 'relationships/create'
    get 'relationships/destroy'
  end
  namespace :user do
    get 'favourites/index'
    get 'favourites/destroy'
  end
  namespace :user do
    get 'ranking/index'
  end
  namespace :user do
    get 'post/new'
    get 'post/index'
    get 'post/create'
    get 'post/show'
    get 'post/update'
    get 'post/destroy'
  end
  namespace :user do
    get 'users/show'
    get 'users/edit'
    get 'users/update'
    get 'users/withdraw'
    get 'users/unsubscribe'
  end
  namespace :user do
    get 'comments/index'
    get 'comments/create'
    get 'comments/destroy'
  end
  namespace :user do
    get 'homes/top'
    get 'homes/about'
  end
  devise_for :user, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin, controllers: {
  sessions: "admin/sessions"
}
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
  # devise_for :admins
  # devise_for :users
      #   t.string :name
      # t.text :introduction
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
