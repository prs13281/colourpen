class User::RelationshipsController < ApplicationController

  # フォローする時
  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end

  # フォロ外す時
  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end

  # フォロー一覧
  # 自分がフォローしている人
  def follower
    @user = User.find(params[:user_id])
    @users = @user.followings
  end
  # フォロワー一覧
  # 自分をフォローしている人
  def followered
    @user = User.find(params[:user_id])
    @users = @user.followers
  end

end
