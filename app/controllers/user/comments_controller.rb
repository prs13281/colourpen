class User::CommentsController < ApplicationController

  # ログインユーザーのみコメント機能使用可
  before_action :authenticate_user!

  def create
    # コメントをする対象の投稿(travel_record)のインスタンスを作成
    @post =Post.find(params[:post_id])
    #投稿に紐づいたコメントを作成
    @comment = @post.comments.build(comment_params)
    @comments_latest3 = @post.comments.limit(3).offset(params[:offset])
    # コメント投稿者(user)のidを代入
    @comment.user_id = current_user.id
    @comments = @post.comments.order(created_at: :desc)
    @comments_next = @post.comments.order(created_at: :desc).offset(3)
    if @comment.save
      flash.now[:notice] = "コメントの投稿に成功しました。"
    else
      flash.now[:alert] ="コメントの投稿に失敗しました。"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user_id == current_user.id
      @comment.destroy
      @post = Post.find(params[:post_id])
      @comments = @post.comments.order(created_at: :desc)
      @comments_next = @comments.offset(3)

    #@comment.post_idから親のpost情報を取得し@comments = @post.comments
    flash.now[:notice] = "コメントを削除しました。"
    else
    redirect_to posts_path
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:comment, :user_id, :post_id)
    end

    def set_comments
      # postに紐づくcommtnsを新着順で取得
      @post_comments = @post.comments.includes(:user).order('created_at DESC')
    end

end
