class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image
  has_many :favorites, dependent: :destroy
  # 投稿を削除するとコメントも一緒に削除される
  has_many :commments, dependent: :destroy
  has_many :posts, dependent: :destroy

  # フォローをした、されたの関係
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  # 一覧画面で使う
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower

  # 同じ名前不可（一意性をもたせ、２文字以上20文字以内）
  validates :name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 20 }
  # 同じメールアドレス不可、＠の前は４文字以上、後ろは２０文字以内
  # validates :email, presence: true, uniqueness: true, length: { minimum: 2, maximum: 20 }
  # 自己紹介文は50文字以内
  validates :introduction, length: { maximum: 50 }

  # プロフィール画像表示
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/noimage.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  # フォローしたときの処理
  def follow(user_id)
    relationships.create(followed_id: user_id)
  end
  # フォローを外すときの処理
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end
  # フォローしているか判定
  def following?(user)
    followings.include?(user)
  end

  def self.search(keyword)
    # 名前かメールアドレスで検索
    where(["name like ? OR email like ?", "%#{keyword}%", "%#{keyword}%"])
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable


end
