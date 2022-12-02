class Admin::CommentsController < ApplicationController
  # 管理者にログインしている場合のみ表示
  before_action :authenticate_admin!

  def index
  end

  def show
  end

  def edit
  end

  def update
  end
end
