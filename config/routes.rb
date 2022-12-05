Rails.application.routes.draw do

  devise_for :user, skip: [:passwords], controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
}
  #ゲストログイン
  post '/guest_sign_in' => 'user/posts#guest'

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
    root to: "homes#top"
    resources :posts,only: [:show]
    resources :comments,only: [:index, :show, :edit, :update, :destroy]
    resources :users,only: [:index, :show, :edit, :update] do
      # adminから投稿削除した時にuser_idを辿ってredirectするためネストする
      resources :posts,only: [:destroy]
    end
    resources :tags,only: [:new,:create, :update, :destroy]
  end

  scope module: :user do
    root to:"homes#top"
    get'about' => 'homes#about', as:'about'
    resources :tags,only: [:new, :create, :destroy]
    resources :favorites,only: [:create, :destroy]
    resources :rankings,only: [:index]
    get 'users/my_page' => 'users#my_page'
    get 'users/my_page/edit' => 'users#edit'
    patch 'users/my_page/edit' => 'users#update'
    get 'users/withdraw' => 'users#withdraw'
    patch 'users/unsubscribe' => 'users#unsubscribe'
    resources :users do
     # memberでuser_idが含まれるルーティングになる
      member do
        get :favorites
      end
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
    resources :posts,only: [:new, :index, :create, :show, :edit, :update, :destroy] do
    # どの投稿に紐づいたコメントなのかURLが判別できるようにする
      resources :comments, only: [:create, :destroy]
    end
  end

  # devise_for :admins
  # devise_for :users
      #   t.string :name
      # t.text :introduction
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

  # namespace :admin do
    # get 'posts/edit'
    # get 'posts/update'
  # end
  # namespace :admin do
  #   get 'comments/show'
  #   get 'comments/edit'
  #   get 'comments/update'
  # end
  # namespace :admin do
  #   get 'users/index'
  #   get 'users/show'
  #   get 'users/edit'
  #   get 'users/update'
  # end
  # namespace :user do
  #   get 'tags/new'
  #   get 'tags/create'
  #   get 'tags/destroy'
  # end
  # namespace :user do
  #   get 'relationships/index'
  #   get 'relationships/create'
  #   get 'relationships/destroy'
  # end
  # namespace :user do
  #   get 'favourites/index'
  #   get 'favourites/destroy'
  # end
  # namespace :user do
  #   get 'ranking/index'
  # end
  # namespace :user do
  #   get 'users/show'
  #   get 'users/edit'
  #   get 'users/update'
  #   get 'users/withdraw'
  #   get 'users/unsubscribe'
  # end
  # namespace :user do
  #   get 'comments/index'
  #   get 'comments/create'
  #   get 'comments/destroy'
  # end
  # namespace :user do
  #   get 'homes/top'
  #   get 'homes/about'
  # end
  # namespace :user do
  #   get 'rankings/index'
  # end
  # namespace :user do
  #   get 'posts/new'
  #   get 'posts/index'
  #   get 'posts/create'
  #   get 'posts/show'
  #   get 'posts/update'
  #   get 'posts/destroy'
  # end