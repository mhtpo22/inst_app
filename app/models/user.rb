class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  mount_uploader :profileimage, ProfileimageUploader
  has_many :microposts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :active_relationships, class_name: 'Relationship', foreign_key: :follower_id, dependent: :destroy
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: :followed_id, dependent: :destroy
  has_many :following, through: 'active_relationships', source: 'followed'
  has_many :followers, through: 'passive_relationships', source: 'follower'
  
  validates :username, presence: true, length: { minmum: 1, maximum: 10 }
  validates :userid,
    presence: true,
    uniqueness: true,
    length: { minmum: 4, maximum: 10  },
    format:{ with: /\A[a-zA-Z0-9]+\z/ }
    #format: { with: /\A(?!.*(user|login|logout|signup|password)).+\z/}
   
  def feed
    following_ids = "SELECT followed_id FROM relationships
                     WHERE follower_id = :user_id"
    Micropost.where("user_id IN (#{following_ids}) OR user_id = :user_id",
                                 user_id: self.id)
  end
  
  def follow(other_user)
    self.active_relationships.create(followed_id: other_user.id)
  end

  def unfollow(other_user)
    self.active_relationships.find_by(followed_id: other_user.id).destroy
  end
  
    def following?(other_user)
    self.following.include?(other_user)
  end

  def self.search(search)
    if search
      User.where(['username LIKE ?', "%#{search}%"])
    else
      User.all
    end
  end

end
