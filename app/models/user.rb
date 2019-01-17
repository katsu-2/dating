class User < ApplicationRecord
  mount_uploader :img, ImgUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :comments, dependent: :destroy

  enum gender: { 男: 0, 女: 1 }
end
