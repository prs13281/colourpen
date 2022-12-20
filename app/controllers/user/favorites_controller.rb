class User::FavoritesController < ApplicationController

  # ログインユーザーのみお気に入り機能使用可
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @favorite = current_user.favorites.new(post_id: @post.id)
    @favorite.save
  end

  def destroy
    @post = Favorite.find_by(params[:id]).post
    if favorite = Favorite.find_by(params[:id])
      favorite.destroy
    end
  end
end
