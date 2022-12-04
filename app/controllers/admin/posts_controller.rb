class Admin::PostsController < ApplicationController
   # 管理者にログインしている場合のみ表示
  before_action :authenticate_admin!

  def show
    @user = User.find(params[:id])
    #投稿した人の名前表示
    @user = @post.user
    # コメント一覧表示で使用する全コメントデータを代入（新着順で表示）
    @comments = @post.comments.order(created_at: :desc)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    # 入力されたタグを受け取る
    tag_names = tag_params.dig(:tags, :names).split(',')
    if @post.update(post_params)
        @post.save_tag(tag_names)
        redirect_to admin_post_path(@post.id), notice: '更新完了しました:)'
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
     redirect_to admin_user_path(@user.id)
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
