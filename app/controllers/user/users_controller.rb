class User::UsersController < ApplicationController
  before_action :redirect_my_page, only: [:show]

  def my_page
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
     redirect_to users_my_page_path(current_user), notice: 'You have updated book successfully'
    else
     render :edit
    end
  end

  def unsubscribe
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private

  #ストロングパラメーター
  def user_params
    params.require(:user).permit(:name, :introduction, :email, :profile_image)
  end

  def redirect_my_page
    @user = User.find(params[:id])
    redirect_to users_my_page_path if @user == current_user
  end

end
