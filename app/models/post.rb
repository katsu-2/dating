class Post < ApplicationRecord
  mount_uploader :img, ImgUploader
  belongs_to :user
  has_many :comments, dependent: :destroy
end
