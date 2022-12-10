class User::CommentsController < ApplicationController
  # before_action :set_comments, only: [:create]


  def create
    # コメントをする対象の投稿(travel_record)のインスタンスを作成
    @post =Post.find(params[:post_id])
    #投稿に紐づいたコメントを作成
    @comment = @post.comments.build(comment_params)
    @comments_latest3 = @post.comments.limit(3).offset(params[:offset])
    # # 新着コメント3件を除く全コメントを取得 (3件以下の場合は空)
    # @comments_offset3 = @post_comments.offset(3)
    # コメント投稿者(user)のidを代入
    @comment.user_id = current_user.id
    @comments = @post.comments.order(created_at: :asc)
    if @comment.save
      flash.now[:notice] = "コメントの投稿に成功しました。"
    else
      flash.now[:alert] ="コメントの投稿に失敗しました。"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    #@comment.post_idから親のpost情報を取得し@comments = @post.comments
    @post = Post.find(params[:post_id])
    @comments = @post.comments.order(created_at: :asc)
    @comment.destroy
    flash.now[:notice] = "コメントを削除しました。"
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
