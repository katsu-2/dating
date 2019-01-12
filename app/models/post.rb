class Post < ApplicationRecord
  mount_uploader :img, ImgUploader
  belongs_to :user, optional: true
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: {minimum: 5}
  validates :text, presence: true, length: {minimum: 20}
end
