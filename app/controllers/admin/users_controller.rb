class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end
  
  #ストロングパラメーター
  def user_params
    params.require(:user).permit(:name,  :email, :is_deleted)
  end
end
