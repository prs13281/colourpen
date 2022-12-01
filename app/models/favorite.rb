class Favorite < ApplicationRecord

  belongs_to :user
  #belongs_to :ranking
  belongs_to :post
end
