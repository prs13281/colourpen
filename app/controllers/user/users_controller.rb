class User::UsersController < ApplicationController
  def show
    @user = current_user
    # @posts = current_user.posts
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
    @users = current_user
    @users.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  #ストロングパラメーター
  def user_params
    params.require(:user).permit(:name, :introduction, :email, :profile_image)
  end


end
