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

  def withdraw
  end

  def unsubscribe
  end

  #ストロングパラメーター
  def user_params
    params.require(:user).permit(:name, :introduction, :email, :profile_image)
  end


end
