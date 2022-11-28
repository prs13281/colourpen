class Post < ApplicationRecord

  has_one_attached :image
  #tweetsテーブルから中間テーブルに対する関連付け
  has_many :post_tags, dependent: :destroy
  #tweetsテーブルから中間テーブルを介してTagsテーブルへの関連付け
  has_many :tags, through: :post_tags, dependent: :destroy
  has_many :comments
  has_many :favorites
  belongs_to :user

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  # def get_post_image(post.id)
  #   if image.attached?
  #     image
  #   else
  #     'no_image.jpg'
  #   end
  # end

end
