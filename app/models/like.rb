class Like < ApplicationRecord
  belongs_to :micropost, counter_cache: :likes_count
  belongs_to :user
  validates :userid, presence: true
  validates :micropost_id, presence: true
end
