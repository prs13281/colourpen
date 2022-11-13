Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  # devise_for :users
      #   t.string :name
      # t.text :introduction
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
