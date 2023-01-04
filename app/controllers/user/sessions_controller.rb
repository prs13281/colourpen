# frozen_string_literal: true

class User::SessionsController < Devise::SessionsController

  before_action :user_state, only: [:create]

   protected
  # 退会しているかを判断するメソッド
  def user_state
    ##入力されたemailからアカウントを1件取得
    @user = User.find_by(email: params[:user][:email])
    ## アカウントを取得できなかった場合、このメソッドを終了する
    return if !@user
    ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
    if @user.valid_password?(params[:user][:password]) && @user.is_deleted
      ## 【処理内容3】
      # if @customer.is_deleted == ture
      redirect_to new_user_registration_path
      # end
    end
  end

end
