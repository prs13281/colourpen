class User < ApplicationRecord
    has_one_attached :image
    has_many :relationsdhip
    has_many :favorite
    has_many :commment
    has_many :post

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


end
