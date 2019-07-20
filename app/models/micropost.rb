class Micropost < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :likes, dependent: :destroy
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true,
    length: { maximum: 140 }
  def like_user(userid)
    likes.find_by(userid: userid)
  end
end
