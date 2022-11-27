class User::PostsController < ApplicationController
  def new
    @post = current_user.posts.build
    @post_tag = @post.post_tags.build
    @post_tag.build_tag
    @posts = Post.page(params[:page]).per(10)
    @tag_list=Tag.all
  end

  def index
    @posts = Post.all
  end

  def create
    @post = current_user.posts.build(post_params)
      # 受け取った値を,で区切って配列にする
    tag_names = tag_params.dig(:tags, :names).split(',')
    tag_names.each do |tag_name|
      @post_tag = @post.post_tags.build
      @post_tag.build_tag(name: tag_name)
    end
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
  end

  def edit
    @post = Post.find(params[:id])
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

  def post_params
    params.require(:post).permit(
      :title,
      :place,
      :tag_list,
      :introduction)
  end

  def tag_params
    params.require(:post).permit(
      tags: [:names])
  end

  def currect_user
    @post = Post.find(params[:id])
    @user = @post.user
    redirect_to posts_path unless @user == current_user
  end

end
