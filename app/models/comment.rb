class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :post
  # 300文字以内で、空白ではコメントできない
  validates :comment, presence: true, length: { maximum: 300 }

end
