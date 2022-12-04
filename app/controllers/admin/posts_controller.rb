class Admin::PostsController < ApplicationController
   # 管理者にログインしている場合のみ表示
  before_action :authenticate_admin!

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

end
