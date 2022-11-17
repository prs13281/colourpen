class User::PostsController < ApplicationController
  def new
  end

  def index
  end

  def create
  end

  def show
  end

  def update
  end

  def destroy
  end

  #ゲストログイン用
  def guest
    user          = User.new(user_params)
    user.name     = "ゲストユーザー"
    user.email    = SecureRandom.alphanumeric(10) + "@email.com"
    user.password = SecureRandom.alphanumeric(10)
    user.save
    sign_in user
    redirect_to posts_path
  end

  private

  def user_params
    params.permit(:name, :email, :password)
  end
end
