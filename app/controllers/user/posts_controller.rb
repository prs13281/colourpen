class User::PostsController < ApplicationController
  def new
    # current_userからbuildで書くとuser_id作られる
    @post = current_user.posts.build
    # postする時にtagが作られるようにする
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
     # タグを複数投稿できるように
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
    # 投稿に対して、いいねを紐付ける
    @post = Post.includes(:favorites).find(params[:id])
    #投稿した人の名前表示
    @user = @post.user
    # コメント一覧表示で使用する全コメントデータを代入（新着順で表示）
    @comments = @post.comments.order(created_at: :desc)
    # コメントの作成
    @comment = Comment.new
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
    params.permit(
      :name,
      :email,
      :password)
  end

  def post_params
    params.require(:post).permit(
      :title,
      :place,
      :tag_list,
      :image,
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
