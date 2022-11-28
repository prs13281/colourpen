class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :post
  belongs_to :ranking
  # 300文字以内で、空白ではコメントできない
  validates :comment, presence: true, length: { maximum: 300 }

end
