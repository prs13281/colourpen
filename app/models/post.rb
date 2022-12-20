class Post < ApplicationRecord

  has_one_attached :image
  #tweetsテーブルから中間テーブルに対する関連付け
  has_many :post_tags, dependent: :destroy
  #tweetsテーブルから中間テーブルを介してTagsテーブルへの関連付け
  has_many :tags, through: :post_tags, dependent: :destroy
  # userが投稿を削除したら、コメントも一緒に削除される
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :user

  # 写真、タイトル、説明文は空では投稿できないように
  validates :image, presence: true
  validates :title, presence: true
  validates :introduction, presence: true

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/noimage.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  # 自分の投稿写真にのみ、お気に入りの数を表示する
  def favorites_count(current_user)
    if user == current_user
      " #{favorites.count}"
    end
  end

  # def get_post_image(post.id)
  #   if image.attached?
  #     image
  #   else
  #     'no_image.jpg'
  #   end
  # end
  def save_tag(sent_tags)

    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old|
      self.tags.delete Tag.find_by(name: old)
    end

    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(name: new)
      self.tags << new_post_tag
    end
  end

  def self.search(keyword)
    # titleとtagで検索。joinsでタグテーブルを紐づける。
    joins(:tags).where(["title like ? OR tags.name like ?", "%#{keyword}%", "#{keyword}"])
  end

  def self.search_tag(keyword)
    # titleとtagで検索。joinsでタグテーブルを紐づける。
    joins(:tags).where(["tags.name like ?", "#{keyword}"])
  end

end
