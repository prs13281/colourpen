class User::RankingsController < ApplicationController
  
  def index
    # ユーザーの投稿数ランキング
   @user_post_rankings = User.where(id: Post.group(:user_id).order('count(user_id) desc').pluck(:user_id))
    # 投稿のコメント数ランキング
   @post_comment_ranking = Post.find(Comment.group(:post_id).order('count(post_id) desc').pluck(:post_id))
  end
end
