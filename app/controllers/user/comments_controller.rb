class User::CommentsController < ApplicationController

  def create
    # コメントをする対象の投稿(travel_record)のインスタンスを作成
    @post =Post.find(params[:post_id])
    #投稿に紐づいたコメントを作成
    @comment = @post.comments.new(comment_params)
    # コメント投稿者(user)のidを代入
    @comment.user_id = current_user.id
    @comments = @post.comments
    if @comment.save
      flash.now[:notice] = "コメントの投稿に成功しました。"
    else
      flash.now[:alert] ="コメントの投稿に失敗しました。"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    #@comment.post_idから親のpost情報を取得し@comments = @post.comments
    @comment.destroy
    flash.now[:notice] = "コメントを削除しました。"
    render :index
  end

  private
    def comment_params
      params.require(:comment).permit(:comment, :user_id, :post_id)
    end
end
