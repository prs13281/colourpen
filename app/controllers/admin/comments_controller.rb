class Admin::CommentsController < ApplicationController
  # 管理者にログインしている場合のみ表示
  before_action :authenticate_admin!

  def destroy
    @comment = Comment.find(params[:id])
    # コメントに紐づいてるpost
    @post = @comment.post
    @comment.destroy
    redirect_to admin_post_path(@post.id)
  end
end
