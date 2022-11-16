class Admin::PostsController < ApplicationController
   # 管理者にログインしている場合のみ表示
  before_action :authenticate_admin!

  def edit
  end

  def update
  end
end
