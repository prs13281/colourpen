class Admin::PostsController < ApplicationController
   # 管理者にログインしている場合のみ表示
  before_action :authenticate_admin!

  def show
    @post = Post.find(params[:id])
    #投稿した人の名前表示
    @user = @post.user
     # コメント一覧表示で使用する全コメントデータを代入（新着順で表示）
    @comments = @post.comments.order(created_at: :asc).first(3)
    @comments_next = @post.comments.order(created_at: :asc).offset(3)
    # 緯度経度を保存する
    gon.lng = @post.longitude
    gon.lat = @post.latitude
  end

  def destroy
    user = User.find(params[:user_id])
    post = Post.find(params[:id])
    if post.destroy
     redirect_to admin_user_path(user)
    end
  end

  private

  def post_params
    params.require(:post).permit(
      :title,
      :place,
      :tag_list,
      :image,
      :introduction)
  end

  def tag_params
    params.require(:post).permit(
      tags: [:names])
  end

end
