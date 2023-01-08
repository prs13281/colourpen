class User::PostsController < ApplicationController

  # newとeditはログインユーザーのみ遷移できる
  before_action :authenticate_user!,only: [:new, :edit]
  before_action :correct_post,only: [:edit, :update]

  def new
    # current_userからbuildで書くとuser_id作られる
    @post = current_user.posts.build
    # postする時にtagが作られるようにする
    @post_tag = @post.post_tags.build
    @post_tag.build_tag
    @posts = Post.page(params[:page]).per(10)
    @tag_list = Tag.all
  end

  def index
    @posts = Post.all
  end
  def search
    @posts = Post.search(params[:keyword])
    @keyword = params[:keyword]
    render 'index'
  end

  def search_tag
    @posts = Post.search_tag(params[:keyword])
    @keyword = params[:keyword]
    render 'index'
  end


  def create
    ActiveRecord::Base.transaction do
      @post = current_user.posts.build(post_params)
      # タグを,で区切って複数保存
      tag_names = tag_params.dig(:tags, :names).split(/[[:blank:]]+/)
      if @post.save
        @post.save_tag(tag_names)
        redirect_to post_path(@post)
      else
        render :new
      end
    end
  end

  def show
    # 投稿に対して、いいねを紐付ける
    @post = Post.includes(:favorites).find(params[:id])

    #投稿した人の名前表示
    @user = @post.user
    # コメント一覧表示で使用する全コメントデータを代入（新着順で表示）
    @comments = @post.comments.order(created_at: :desc).first(3)
    @comments_next = @post.comments.order(created_at: :desc).offset(3)
    # コメントの作成
    @comment = Comment.new
    # 緯度経度を保存する
    gon.lng = @post.longitude
    gon.lat = @post.latitude
  end

  def edit
    @post = Post.find(params[:id])
    gon.lng = @post.longitude
    gon.lat = @post.latitude
  end

  def update
    ActiveRecord::Base.transaction do
      @post = Post.find(params[:id])
      # 入力されたタグを受け取る
      tag_names = tag_params.dig(:tags, :names).split(/[[:blank:]]+/)
      if @post.user_id == current_user.id
        @post.update(post_params)
        @post.save_tag(tag_names)
        redirect_to post_path(@post.id), notice: '更新完了しました:)'
      else
        render :edit
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.user_id == current_user.id
      @post.destroy
      redirect_to users_my_page_path
    else
       redirect_to posts_path
    end
  end

  #ゲストログイン用
  def guest
    user          = User.new(user_params)
    user.name     = "ゲストユーザー"+SecureRandom.alphanumeric(10)
    user.email    = SecureRandom.alphanumeric(10) + "@email.com"
    user.password = SecureRandom.alphanumeric(10)
    user.save!
    sign_in user
    redirect_to posts_path
  end

  # ログインユーザー以外がeditに遷移しようとした場合投稿一覧に遷移する
  def correct_post
      @post = Post.find(params[:id])
    unless @post.user.id == current_user.id
      redirect_to posts_path
    end
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
      :introduction,
      :latitude,
      :longitude
      )
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
