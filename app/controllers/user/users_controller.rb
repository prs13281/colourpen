class User::UsersController < ApplicationController
  def show
  end

  def edit
  end

  def update
  end

  def withdraw
  end

  def unsubscribe
  end

  #ストロングパラメーター
  def user_params
    params.require(:user).permit(:name, :introduction, :email, :is_deleted)
  end
end
