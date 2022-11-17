class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  # サインアップ時に名前登録の許可
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

# サインイン後の遷移先
# adminは会員一覧
# userはマイページ
  def after_sign_in_path_for(resource)
   case resource
    when Admin
     admin_users_path
    when User
     users_my_page_path
   end
  end

# サインアウト後の遷移先
# adminはログイン画面
# userはトップ画面
  def after_sign_out_path_for(resource)
    if resource == :admin
     new_admin_session_path
    elsif resource ==  :user
     root_path
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password)
  end

end
