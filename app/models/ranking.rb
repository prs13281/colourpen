class Ranking < ApplicationRecord

  has_many :comment
  has_many :favorite

end
