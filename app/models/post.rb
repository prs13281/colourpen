class Post < ApplicationRecord

  has_one_attached :image
  has_many :post_tag
  has_many :comment
  has_many :favorite
  belongs_to :user

end
