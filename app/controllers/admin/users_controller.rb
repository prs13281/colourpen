class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all
  end

  def search
    @users = User.search(params[:keyword])
    @keyword = params[:keyword]
    render 'index'
  end

  def show
    @user = User.find(params[:id])
    #ユーザーが投稿したものを表示
    @posts = @user.posts
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
     redirect_to admin_user_path(@user.id), notice: 'You have updated book successfully'
    else
     @user = User.find(params[:id])
     render :edit
    end
  end

  #ストロングパラメーター
  def user_params
    params.require(:user).permit(:name, :introduction, :email, :is_deleted)
  end
end
