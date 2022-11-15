class ApplicationController < ActionController::Base

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def after_sign_in_path_for(resource)
   case resource
    when Admin
     admin_users_path
    when User
     root_path
   end
  end

  def after_sign_out_path_for(resource)
    if resource == :admin
     new_admin_session_path
    elsif resource ==  :user
     root_path
    end
  end

end
