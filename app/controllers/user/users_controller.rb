class User::UsersController < ApplicationController
  def show
    @user = current_user
    @posts = @user.posts
  end

  def edit
  end

  def update
    @user = current_user
    if @user.update(user_params)
     redirect_to user_my_page_path(current_user), notice: 'You have updated book successfully'
    else
     render :edit
    end
  end

  def withdraw
  end

  def unsubscribe
  end

  #ストロングパラメーター
  def user_params
    params.require(:user).permit(:name, :introduction, :email)
  end
end
