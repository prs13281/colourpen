class Admin::PostsController < ApplicationController
   # 管理者にログインしている場合のみ表示
  before_action :authenticate_admin!

  def show
    @post = Post.find(params[:id])
    # @user = User.find(params[:id])
    #投稿した人の名前表示
    @user = @post.user
    # コメント一覧表示で使用する全コメントデータを代入（新着順で表示）
    @comments = @post.comments.order(created_at: :desc)
  end

  def destroy
    # @user = User.find(params[:id])
    @post = Post.find(params[:id])
    if @post.destroy
     redirect_to admin_user_path
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
