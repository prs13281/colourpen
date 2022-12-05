class User::RankingsController < ApplicationController

  def index
    # お気に入り数ランキング
    @favorite_ranks = Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(5).pluck(:post_id))
    # 投稿のコメント数ランキング
    @comment_ranks = Post.find(Comment.group(:post_id).order('count(post_id) desc').limit(5).pluck(:post_id))
    # @post = Post.find(params[:id])
  end
end
