class Like < ApplicationRecord
  belongs_to :micropost
  belongs_to :user
  validates :userid, presence: true
  validates :micropost_id, presence: true
end
